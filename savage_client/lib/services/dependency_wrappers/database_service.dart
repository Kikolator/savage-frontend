import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/booking.dart';
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

  static const _kWorkspaceId = '0001';

  // Collection and document paths
  static const _kWorkspacesCollectionPath = 'workspaces';
  static const _kDesksCollectionPath = 'desks';
  static const _kBookingCollectionPath = 'bookings';
  static const _kUsersCollectionPath = 'users';

  // Collection References
  CollectionReference get _bookingsCollection =>
      _db.collection(_kBookingCollectionPath);
  CollectionReference _desksCollection(String workspaceId) => _db
      .collection(_kWorkspacesCollectionPath)
      .doc(workspaceId)
      .collection(_kDesksCollectionPath);

  Future<void> setNewBooking({
    required Booking booking,
  }) async {
    try {
      final batch = _db.batch();
      batch.set(_bookingsCollection.doc(booking.bookingId), booking.toData());
      batch.update(_desksCollection(_kWorkspaceId).doc(booking.deskId), {
        'bookings': FieldValue.arrayUnion([booking.toData()])
      });
      await batch.commit();
    } catch (error) {
      rethrow;
    }
  }

  String getNewDocumentId({required String collectionPath}) {
    return _db.collection(collectionPath).doc().id;
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

  Future<List<Map<String, dynamic>>> getCollection({
    required String collection,
    Object? queryField,
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
  }) async {
    late final QuerySnapshot<Map<String, dynamic>> querySnapshot;
    if (queryField != null) {
      querySnapshot = await _db
          .collection(collection)
          .where(queryField,
              isEqualTo: isEqualTo,
              isNotEqualTo: isNotEqualTo,
              isLessThan: isLessThan,
              isLessThanOrEqualTo: isLessThanOrEqualTo,
              isGreaterThan: isGreaterThan,
              isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
              arrayContains: arrayContains,
              arrayContainsAny: arrayContainsAny,
              whereIn: whereIn,
              whereNotIn: whereNotIn,
              isNull: isNull)
          .get();
    } else {
      querySnapshot = await _db.collection(collection).get();
    }
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getSubCollection({
    required String collection,
    required String documentId,
    required String subCollection,
    Object? queryField,
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
  }) async {
    late final QuerySnapshot<Map<String, dynamic>> querySnapshot;
    if (queryField != null) {
      querySnapshot = await _db
          .collection(collection)
          .doc(documentId)
          .collection(subCollection)
          .where(queryField,
              isEqualTo: isEqualTo,
              isNotEqualTo: isNotEqualTo,
              isLessThan: isLessThan,
              isLessThanOrEqualTo: isLessThanOrEqualTo,
              isGreaterThan: isGreaterThan,
              isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
              arrayContains: arrayContains,
              arrayContainsAny: arrayContainsAny,
              whereIn: whereIn,
              whereNotIn: whereNotIn,
              isNull: isNull)
          .get();
    } else {
      querySnapshot = await _db
          .collection(collection)
          .doc(documentId)
          .collection(subCollection)
          .get();
    }
    return querySnapshot.docs.map((doc) => doc.data()).toList();
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

  // Future<void> addDummyData() async {
  //   final dummyData = DummyData.fromLocal();
  //   final workspace = dummyData.workspace;
  //   final workspaceId = workspace.workspaceId;
  //   final desks = dummyData.desks;
  //   final workspaceDocumentRef = _db.collection('workspaces').doc(workspaceId);
  //   final desksCollectionRef = workspaceDocumentRef.collection('desks');
  //   final batch = _db.batch();
  //   batch.set(workspaceDocumentRef, workspace.toData());
  //   for (int i = 0; i < desks.length; i++) {
  //     final deskId = desks[i].deskId;
  //     batch.set(desksCollectionRef.doc(deskId), desks[i].toData());
  //   }
  //   try {
  //     await batch.commit();
  //   } catch (error) {
  //     print({'function': 'addDummyData()', 'error': error});
  //   }
  // }
}
