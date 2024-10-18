import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/data/user.dart';
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
  static const _kMemberDataCollectionPath = 'member_data';

  // Collection References
  CollectionReference<Map<String, dynamic>> get _bookingsCollection =>
      _db.collection(_kBookingCollectionPath);
  CollectionReference _desksCollection(String workspaceId) => _db
      .collection(_kWorkspacesCollectionPath)
      .doc(workspaceId)
      .collection(_kDesksCollectionPath);
  CollectionReference<Map<String, dynamic>> get _memberDataCollection =>
      _db.collection(_kMemberDataCollectionPath);
  CollectionReference<Map<String, dynamic>> get _userCollection =>
      _db.collection(_kUsersCollectionPath);

  Future<void> setNewBooking({
    required Booking booking,
  }) async {
    try {
      final batch = _db.batch();
      batch.set(_bookingsCollection.doc(booking.bookingId), booking.toData());
      batch.update(_desksCollection(_kWorkspaceId).doc(booking.deskId), {
        Desk.kBookings: FieldValue.arrayUnion([booking.toData()])
      });
      await batch.commit();
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Booking>> fetchBookings({required String uid}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _bookingsCollection
              .where(Booking.kUserId, isEqualTo: uid)
              .get();
      return querySnapshot.docs
          .map((doc) => Booking.fromData(doc.data()))
          .toList();
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

  Future<String> setMemberData({
    required String uid,
    required String? companyName,
    required String? website,
    required String? description,
    required String? photoUrl,
    required bool memberVisible,
  }) async {
    final batch = _db.batch();
    final memberDataDocumentReference = _memberDataCollection.doc();
    final memberData = MemberData(
        id: memberDataDocumentReference.id,
        companyName: companyName,
        website: website,
        description: description,
        photoUrl: photoUrl,
        uid: uid,
        memberVisible: memberVisible);
    batch.set(memberDataDocumentReference, memberData.toData());
    final userDocumentReference = _userCollection.doc(uid);
    batch.update(userDocumentReference, {
      User.kMemberDataId: memberDataDocumentReference.id,
    });
    await batch.commit();
    return memberData.id;
  }

  Future<List<Map<String, dynamic>>> queryMemberData() async {
    final query = await _memberDataCollection
        .where(MemberData.kMemberVisible, isEqualTo: true)
        .get();
    final result = query.docs.map((doc) => doc.data()).toList();
    return result;
  }

  Future<Map<String, dynamic>> getUserMemberData(
      {required String memberDataId}) async {
    final snapshot = await _memberDataCollection.doc(memberDataId).get();
    if (snapshot.exists) {
      return snapshot.data()!;
    } else {
      throw Exception('Document does not exist');
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
