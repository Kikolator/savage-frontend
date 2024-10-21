import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/env.dart';

class StorageService {
  final _logger = getLogger('StorageService');
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
  Reference get _rootReference => _storage.ref();
  Reference _userReference(String uid) =>
      _rootReference.child('users').child(uid);
  Reference _profilePictureReference(String uid) =>
      _userReference(uid).child('profile_picture');

  /// Sets a profile image for the user and returns the storage url
  Future<String> updateProfilePicture(
      {required String uid, required XFile file}) async {
    _logger.v(
        'Putting file ${file.path} on profile reference: ${_profilePictureReference(uid).fullPath}');
    if (kIsWeb) {
      await _profilePictureReference(uid).putData(await file.readAsBytes());
    } else {
      await _profilePictureReference(uid).putFile(File(file.path));
    }

    _logger.v('Getting download url');
    return _profilePictureReference(uid).getDownloadURL();
  }
}
