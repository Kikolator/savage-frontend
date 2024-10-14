import 'package:firebase_auth/firebase_auth.dart';
import 'package:savage_client/env.dart';

class AuthenticationService {
  AuthenticationService(this._auth);
  final FirebaseAuth _auth;

  static AuthenticationService? _instance;
  static AuthenticationService getInstance() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    // If running debug mode connect to local emulator
    if (Env.kLocalEmulatorMode) {
      auth.useAuthEmulator(Env.kLocalHost, Env.kLocalAuthPort);
    }
    return _instance ??= AuthenticationService(auth);
  }

  /// Gets the current Firebase Auth app.
  /// !!! Use specifically for Firebase UI Models,
  /// avoid in all other cases !!!
  FirebaseAuth get firebaseAuth => _auth;

  User? get _currentUser => _auth.currentUser;

  /// Checks if current user object is not null
  bool get isSignedIn => _currentUser != null;

  /// Checks if user email is verified
  /// Throws Exception if no user signed in
  bool get isEmailVerified {
    if (_currentUser == null) {
      throw AuthenticationServiceException(
        code: AuthenticationServiceException.kUserNotSignedIn,
        message: 'User needs to be signed in to get isEmailVerified',
      );
    }
    return _currentUser!.emailVerified;
  }

  /// Gets current user uid, throws Exception if user is null
  String get uid {
    if (_currentUser == null) {
      throw AuthenticationServiceException(
        code: AuthenticationServiceException.kUserNotSignedIn,
        message: 'User needs to be signed in to get uid',
      );
    }
    return _currentUser!.uid;
  }

  String get email {
    if (_currentUser == null) {
      throw AuthenticationServiceException(
        code: AuthenticationServiceException.kUserNotSignedIn,
        message: 'User needs to be signed in to get email',
      );
    }
    if (_currentUser!.email == null) throw Exception('User email is null');
    return _currentUser!.email!;
  }

  String? get photoUrl {
    if (_currentUser == null) {
      throw AuthenticationServiceException(
        code: AuthenticationServiceException.kUserNotSignedIn,
        message: 'User needs to be signed in to get photo url',
      );
    }
    return _currentUser?.photoURL;
  }

  /// Signs out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthenticationServiceException implements Exception {
  static const int kUserNotSignedIn = 401;
  static const int kUnknown = 400;

  final int code;
  final String message;

  AuthenticationServiceException({
    this.code = kUnknown,
    this.message = 'Unknown error',
  });

  @override
  String toString() => 'Exception $code: $message';
}
