import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/member_data.dart';
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
  String? get firstName => _user?.firstName;
  String? get lastName => _user?.lastName;

  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String phoneWhatsapp,
    required String contactEmail,
    required String contactPhone,
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
      contactPhone: contactPhone,
      signupEmail: email,
      signupPhone: null,
      membershipStatus: MembershipStatus.inactive,
      membershipTypes: [],
      availableCredits: null,
      joinedAt: DateTime.now(),
      memberVisible: false,
      memberDataId: null,
      requestInvoice: false,
      invoiceData: {},
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

  Future<MemberData> getUserMemberData() async {
    // TODO get member data from database.
    final memberDataId = _user?.memberDataId;
    if (memberDataId == null) {
      throw Exception('User or memberDataId is null. Cannot get member data.');
    }
    final Map<String, dynamic> data =
        await _databaseService.getUserMemberData(memberDataId: memberDataId);
    return MemberData.fromData(data);
  }

  Future<void> setMemberData(
      {required String? companyName,
      required String? website,
      required String? description,
      required String? photoUrl,
      required bool memberVisible}) async {
    final uid = _authenticationService.uid;
    final String memberDataId = await _databaseService.setMemberData(
      uid: uid,
      companyName: companyName,
      website: website,
      description: description,
      photoUrl: photoUrl,
      memberVisible: memberVisible,
    );
    // TODO update user model member data id locally.
  }

  Future<List<MemberData>> queryMemberData() async {
    final List<Map<String, dynamic>> memberData =
        await _databaseService.queryMemberData();
    return memberData.map((data) => MemberData.fromData(data)).toList();
  }
}
