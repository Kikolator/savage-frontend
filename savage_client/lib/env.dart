import 'package:flutter/foundation.dart';

/// Class to manage local environment variables.
class Env {
  static bool kLocalEmulatorMode = kDebugMode;
  static String kLocalHost = 'localhost';
  static int kLocalAuthPort = 9099;
  static int kLocalFirestorePort = 8080;
  static int kLocalStoragePort = 9199;
  static int kLocalFunctionsPort = 5001;
  static int kLocalFlutterDebugPort = 6969;
  static String actionCodeUrl = kLocalEmulatorMode
      ? '$kLocalHost:$kLocalFlutterDebugPort'
      : 'https://my.savage-coworking.com';
}
