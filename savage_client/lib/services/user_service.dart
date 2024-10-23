import 'package:image_picker/image_picker.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/user.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';
import 'package:savage_client/services/dependency_wrappers/storage_service.dart';

class UserService {
  final _logger = getLogger('UserService');
  final _authenticationService = locator<AuthenticationService>();
  final _databaseService = locator<DatabaseService>();
  final _storageService = locator<StorageService>();

  static const String kUserDbCollection = 'users';

  User? _user;
  User? get user => _user;

  bool get isSignedIn => _authenticationService.isSignedIn;
  bool get isEmailVerified => _authenticationService.isEmailVerified;
  String get getSignupEmail => _authenticationService.email;
  String? get getPhotoUrl => _user?.photoUrl;
  String? get firstName => _user?.firstName;
  String? get lastName => _user?.lastName;

  /// Creates user and empty memberData in firestore
  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String phoneWhatsapp,
    required String contactEmail,
    required String contactPhone,
    required DateTime dateOfBirth,
  }) async {
    _logger.d('creating user');
    // Get Firebase uid
    final uid = _authenticationService.uid;
    final email = _authenticationService.email;
    final photoUrl = _authenticationService.photoUrl;

    // Create new User model with data
    final user = User(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      phoneWhatsapp: phoneWhatsapp,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      signupEmail: email,
      signupPhone: null,
      membershipStatus: MembershipStatus.inactive,
      membershipTypes: [],
      availableCredits: null,
      joinedAt: DateTime.now(),
      memberDataId: null,
      requestInvoice: false,
      invoiceData: {},
      photoUrl: photoUrl,
      checkedIn: false,
    );
    _logger.v(user.toString());
    // _logger.v('create member object');
    // final memberData = MemberData.empty();
    // memberData.setUid(uid);
    // memberData.setFirstName(firstName);
    // memberData.setLastName(lastName);
    await _databaseService.createUser(
      uid: uid,
      user: user,
      // memberData: memberData,
    );
    // set local _user
    _logger.v('setting local user object');
    _user = user;
    _logger.v('User created');
    return;
  }

  Future<void> updateUser(User user) async {
    await _databaseService.updateDocument(
        data: user.toData(),
        collection: kUserDbCollection,
        documentId: user.uid);
    _user = user;
    return;
  }

  /// Returns User? object
  /// If null: User document does not exist or user is not signed in.
  Future<User?> getUser() async {
    try {
      final String uid = _authenticationService.uid;
      final Map<String, dynamic>? data = await _databaseService.getDocument(
          collection: kUserDbCollection, documentId: uid);
      if (data != null) {
        _user = User.fromData(data);
        return _user;
      } else {
        return null;
      }
    } catch (error) {
      if (error is AuthenticationServiceException) {
        if (error.code == AuthenticationServiceException.kUserNotSignedIn) {
          return null;
        }
      }
      rethrow;
    }
  }

  // TODO listen to user

  Future<void> signOut() async {
    await _authenticationService.signOut();
    // TODO dispose();
    return;
  }

  Future<void> setCheckInOut(bool checkedIn) async {
    if (!isSignedIn) {
      throw Exception('user is not signed in');
    }
    final uid = _authenticationService.uid;
    await _databaseService.checkInOutUser(uid: uid, checkedIn: checkedIn);
    _user!.setCheckedIn(checkedIn);
  }

  /// Sets new file to storage, updates user object, and returns storage url
  Future<String> updateProfilePicture({required XFile file}) async {
    _logger.v('updating profile picture');
    if (!isSignedIn) {
      _logger.e('user is not signed in');
      throw Exception('User is not signed in');
    }
    final uid = _authenticationService.uid;
    // Update storage
    final String imageUrl =
        await _storageService.updateProfilePicture(uid: uid, file: file);
    _logger.v('download url: $imageUrl');
    // Update local objects
    _user?.photoUrl = imageUrl;
    _logger.v('set download url on User object');
    // update database
    await _databaseService.updateProfilePicture(
      uid: uid,
      photoUrl: imageUrl,
    );
    _logger.v('download url set in database');

    return imageUrl;
  }
}
