import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/check_in_out.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/data/desk_booking.dart';
import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/data/enums/booking_type.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/meeting_room.dart';
import 'package:savage_client/data/meeting_room_booking.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/data/user.dart';
import 'package:savage_client/env.dart';

class DatabaseService {
  final _logger = getLogger('DatabaseService');
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
  // static const _kWorkspacesCollectionPath = 'workspaces';
  static const kDesksCollectionPath = 'desks';
  static const kMeetingRoomCollectionPath = 'meeting_rooms';
  static const _kBookingCollectionPath = 'bookings';
  static const _kUsersCollectionPath = 'users';
  static const _kMemberDataCollectionPath = 'member_data';
  static const _kCheckedInOutCollectionPath = 'check_in_out_sessions';

  // Collection References
  CollectionReference<Map<String, dynamic>> get _bookingsCollection =>
      _db.collection(_kBookingCollectionPath);
  CollectionReference<Map<String, dynamic>> get _desksCollection =>
      _db.collection(kDesksCollectionPath);
  CollectionReference<Map<String, dynamic>> get _meetingRoomCollection =>
      _db.collection(kMeetingRoomCollectionPath);
  CollectionReference<Map<String, dynamic>> get _memberDataCollection =>
      _db.collection(_kMemberDataCollectionPath);
  CollectionReference<Map<String, dynamic>> get _userCollection =>
      _db.collection(_kUsersCollectionPath);
  CollectionReference<Map<String, dynamic>> get _checkedInOutCollection =>
      _db.collection(_kCheckedInOutCollectionPath);

  Future<void> setNewBooking({
    required Booking booking,
  }) async {
    try {
      final batch = _db.batch();
      batch.set(_bookingsCollection.doc(booking.id), booking.toData());
      // batch.update(_desksCollection(_kWorkspaceId).doc(booking.deskId), {
      //   Desk.kBookings: FieldValue.arrayUnion([booking.toData()])
      // });
      await batch.commit();
    } catch (error) {
      rethrow;
    }
  }

  /// Fetch all confirmed desk bookings
  Future<List<DeskBooking>> fetchConfirmedDeskBookings() async {
    try {
      _logger.v('fetching confirmed desk bookings');
      final querySnapshot = await _bookingsCollection
          .where(Booking.kStatus, isEqualTo: BookingStatus.confirmed.name)
          .where(Booking.kType, isEqualTo: BookingType.desk.name)
          .get();
      return querySnapshot.docs
          .map((doc) => DeskBooking.fromData(doc.data()))
          .toList();
    } catch (error) {
      _logger.e(error);
      throw UnimplementedError('Handle Error');
    } finally {
      _logger.v('confirmed desk bookings fetched');
    }
  }

  /// Fetch all confirmed meeting room bookings
  Future<List<MeetingRoomBooking>> fetchConfirmedMeetingRoomBookings() async {
    try {
      _logger.v('fetching confirmed meeting room bookings');
      final querySnapshot = await _bookingsCollection
          .where(Booking.kStatus, isEqualTo: BookingStatus.confirmed.name)
          .where(Booking.kType, isEqualTo: BookingType.meetingRoom.name)
          .get();
      return querySnapshot.docs
          .map((doc) => MeetingRoomBooking.fromData(doc.data()))
          .toList();
    } catch (error) {
      _logger.w(error);
      rethrow;
    }
  }

  /// Fetch bookings for uid.
  Future<List<Booking>> fetchBookings({required String? uid}) async {
    try {
      _logger.v('fetching bookings for uid: $uid');
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _bookingsCollection
              .where(Booking.kMemberId, isEqualTo: uid)
              .get();
      final List<Booking> bookings = [];
      bookings.addAll(querySnapshot.docs
          .where((item) => item[Booking.kType] == BookingType.desk.name)
          .map((doc) => DeskBooking.fromData(doc.data())));
      bookings.addAll(querySnapshot.docs
          .where((item) => item[Booking.kType] == BookingType.meetingRoom.name)
          .map((item) => MeetingRoomBooking.fromData(item.data())));
      return bookings;
    } catch (error) {
      _logger.w(error);
      rethrow;
    }
  }

  String getNewDocumentId({required String collectionPath}) {
    _logger.v('Getting new doc id');
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
    _logger.d(
        'Getting document from db, collection: $collection, id: $documentId');
    final snapshot = await _db.collection(collection).doc(documentId).get();
    _logger.v('snapshot exists: ${snapshot.exists}');
    if (snapshot.exists) {
      final data = snapshot.data();
      _logger.v('snapshot data: $data');
      if (data != null) {
        return data;
      } else {
        throw Exception('Document data is null');
      }
    } else {
      return null;
    }
  }

  Future<MemberData> setMemberData({required MemberData memberData}) async {
    _logger.d('Setting member data in db');
    final batch = _db.batch();
    final memberDataId = memberData.id;
    // If memberData.id is empty, we need to set it
    // Else we can update existing.
    if (memberDataId.isEmpty) {
      _logger.v('memberDataId is empty, creating new member data');
      final memberDataReference = _memberDataCollection.doc();
      _logger.v('memberDataId: ${memberDataReference.id}');
      memberData.setId(memberDataReference.id);
      _logger.v('setting member data on batch');
      batch.set(memberDataReference, memberData.toData());
      _logger.v('updating user on batch');
      batch.update(_userCollection.doc(memberData.uid),
          {User.kMemberDataId: memberDataReference.id});
    } else {
      _logger.v('memberDataId: $memberDataId, updating existing member data');
      batch.update(
          _memberDataCollection.doc(memberDataId), memberData.toData());
    }
    _logger.v('commiting batch');
    await batch.commit();
    _logger.v('member data set in db');
    return memberData;
  }

  Future<List<Map<String, dynamic>>> queryMemberData() async {
    _logger.d('querying member data where visible is true and active');
    final query = await _memberDataCollection
        .where(MemberData.kMemberVisible, isEqualTo: true)
        .where(MemberData.kMembershipStatus,
            isEqualTo: MembershipStatus.active.name)
        .get();
    final result = query.docs.map((doc) => doc.data()).toList();
    return result;
  }

  Future<Map<String, dynamic>> getUserMemberData(
      {required String memberDataId}) async {
    _logger.d('Getting user member data');
    _logger.v('memberDataId: $memberDataId');
    final snapshot = await _memberDataCollection.doc(memberDataId).get();
    if (snapshot.exists) {
      _logger.v('snapshot exists');
      return snapshot.data()!;
    } else {
      throw Exception('Document does not exist');
    }
  }

  Future<void> createUser({
    required String uid,
    required User user,
    // required MemberData memberData,
  }) async {
    _logger.d('setting user in db');
    // set user
    await _userCollection.doc(uid).set(user.toData());
    _logger.v('user set in db');
    return;
  }

  /// Checks in User by:
  ///   - adding object to checkedInOut collection
  ///   - updating user checkedIn variable
  Future<void> checkInOutUser(
      {required String uid, required bool checkedIn}) async {
    final batch = _db.batch();
    batch.update(_userCollection.doc(uid), {User.kCheckedIn: checkedIn});
    final checkInOutReference = _checkedInOutCollection.doc();
    final checkInOut = CheckInOut(
        id: checkInOutReference.id,
        uid: uid,
        checkedIn: checkedIn,
        timestamp: DateTime.now(),
        workspaceId: _kWorkspaceId);
    batch.set(checkInOutReference, checkInOut.toData());
    await batch.commit();
  }

  /// Updates the photo url on the user object
  Future<void> updateProfilePicture(
      {required String uid, required String photoUrl}) async {
    _logger.v('Updating ${User.kPhotoUrl}: $photoUrl on user doc: $uid, ');
    await _userCollection.doc(uid).update({User.kPhotoUrl: photoUrl});
    return;
  }

  /// Fetches available hot desks from database.
  Future<List<Desk>> fetchAvailableHotDesks() async {
    _logger.v('fetching available hot desks from db');
    final querySnapshot =
        await _desksCollection.where(Desk.kAvailable, isEqualTo: true).get();
    return querySnapshot.docs.map((doc) => Desk.fromData(doc.data())).toList();
  }

  Future<void> setDesk({required Desk desk}) async {
    _logger.v('desk id: ${desk.deskId}');
    _logger.v('setting desk in db');
    await _desksCollection.doc(desk.deskId).set(desk.toData());
  }

  Future<void> setMeetingRoom({required MeetingRoom meetingRoom}) async {
    final reference = _meetingRoomCollection.doc();
    _logger.v('meeting room id: ${reference.id}');
    meetingRoom.copyWith(id: reference.id);
    _logger.v('setting meeting room in db');
    await reference.set(meetingRoom.toData());
    return;
  }

  Future<List<MeetingRoom>> fetchAvailableMeetingRooms() async {
    _logger.v('fetching available meeting rooms from db');
    final querySnapshot = await _meetingRoomCollection
        .where(MeetingRoom.kActive, isEqualTo: true)
        .get();
    return querySnapshot.docs
        .map((doc) => MeetingRoom.fromData(doc.data()))
        .toList();
  }

  Future<void> cancelBooking({required String bookingId}) async {
    try {
      await _bookingsCollection
          .doc(bookingId)
          .update({Booking.kStatus: BookingStatus.canceled.name});
    } catch (error) {
      _logger.w('error on cancelling booking: ${error.toString()}');
      rethrow;
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
