import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/dummy_data/dummy_db.dart';
import 'package:savage_client/env.dart';

class DatabaseService {
  final FirebaseFirestore _db;
  DatabaseService(this._db);

  static DatabaseService? _instance;
  static DatabaseService getInstance() {
    final firestoreInstance = FirebaseFirestore.instance;
    if (Env.kLocalEmulatorMode) {
      firestoreInstance.useFirestoreEmulator(
          Env.kLocalHost, Env.kLocalFirestorePort);
    }
    return _instance ??= DatabaseService(firestoreInstance);
  }

  Future<void> createDocument(
      {required Map<String, dynamic> data,
      required String collection,
      String? documentId}) async {
    await _db.collection(collection).doc(documentId).set(data);
  }

  Future<void> updateDocument(
      {required Map<String, dynamic> data,
      required String collection,
      required String documentId}) async {
    await _db.collection(collection).doc(documentId).update(data);
  }

  Future<Map<String, dynamic>?> getDocument(
      {required String collection, required String documentId}) async {
    final snapshot = await _db.collection(collection).doc(documentId).get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null) {
        return data;
      } else {
        throw Exception('Document data is null');
      }
    } else {
      return null;
    }
  }

  Future<void> addDummyData() async {
    final dummyData = DummyData.fromLocal();
    final workspace = dummyData.workspace;
    final workspaceId = workspace.workspaceId;
    final desks = dummyData.desks;
    final workspaceDocumentRef = _db.collection('workspaces').doc(workspaceId);
    final desksCollectionRef = workspaceDocumentRef.collection('desks');
    final batch = _db.batch();
    batch.set(workspaceDocumentRef, workspace.toData());
    for (int i = 0; i < desks.length; i++) {
      final deskId = desks[i].deskId;
      batch.set(desksCollectionRef.doc(deskId), desks[i].toData());
    }
    try {
      await batch.commit();
    } catch (error) {
      print({'function': 'addDummyData()', 'error': error});
    }
  }
}
