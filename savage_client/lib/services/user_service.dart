import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/user.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';

class UserService {
  final _authenticationService = locator<AuthenticationService>();
  final _databaseService = locator<DatabaseService>();

  static const String kUserDbCollection = 'users';

  User? _user;

  bool get isSignedIn => _authenticationService.isSignedIn;

  bool get isEmailVerified => _authenticationService.isEmailVerified;

  String get getSignupEmail => _authenticationService.email;

  String? get getPhotoUrl => _user?.photoUrl;

  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String phoneWhatsapp,
    required String contactEmail,
  }) async {
    // Get Firebase uid
    final uid = _authenticationService.uid;
    final email = _authenticationService.email;
    final photoUrl = _authenticationService.photoUrl;

    // Create new User model with data
    final user = User(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      phoneWhatsapp: phoneWhatsapp,
      contactEmail: contactEmail,
      signupEmail: email,
      signupPhone: null,
      membershipStatus: MembershipStatus.none,
      photoUrl: photoUrl,
    );
    // Set to database
    await _databaseService.createDocument(
      collection: kUserDbCollection,
      documentId: uid,
      data: user.toData(),
    );
  }

  Future<void> updateUser(User user) async {
    await _databaseService.updateDocument(
        data: user.toData(),
        collection: kUserDbCollection,
        documentId: user.uid);
  }

  /// Returns User? object
  /// If null: User document does not exist or user is not signed in.
  Future<User?> getUser() async {
    try {
      final String uid = _authenticationService.uid;
      final Map<String, dynamic>? data = await _databaseService.getDocument(
          collection: kUserDbCollection, documentId: uid);
      if (data != null) {
        return User.fromData(data);
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

  Future<void> signOut() async {
    await _authenticationService.signOut();
  }
}
