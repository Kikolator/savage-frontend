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
}
