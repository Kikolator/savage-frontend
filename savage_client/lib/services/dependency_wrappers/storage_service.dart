import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:savage_client/env.dart';

class StorageService {
  final FirebaseStorage _storage;

  StorageService(this._storage);

  static StorageService? _instance;
  static StorageService getInstance() {
    final storageInstance = FirebaseStorage.instance;
    if (kDebugMode) {
      storageInstance.useStorageEmulator(Env.kLocalHost, Env.kLocalStoragePort);
    }
    return _instance ??= StorageService(storageInstance);
  }

  // Storage references
  Reference get rootReference => _storage.ref();
  Reference userReference(String uid) =>
      rootReference.child('users').child(uid);

  Future<void> addProfilePicture() async {}
}
