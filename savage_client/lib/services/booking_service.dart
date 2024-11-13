import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/data/desk_booking.dart';
import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/data/enums/booking_type.dart';
import 'package:savage_client/data/exceptions/booking_exception.dart';
import 'package:savage_client/data/meeting_room.dart';
import 'package:savage_client/data/meeting_room_booking.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';

class BookingService {
  final _logger = getLogger('BookingService');
  static const kCollection = 'bookings';

  final _databaseService = locator<DatabaseService>();
  final _authenticationService = locator<AuthenticationService>();

  Future<DeskBooking> bookDesk(
      {required DateTime startDateTime,
      required DateTime endDateTime,
      required Desk hotDesk}) async {
    // check membership status
    final isClient = await _authenticationService.isClient(true);
    if (!isClient) {
      throw BookingException(
          code: BookingException.noClient,
          message: 'You need to have an active subscription to book a desk');
    }
    // TODO check desk is available
    // Get uid
    final String uid = _authenticationService.uid;
    // Get new doc id
    final docId =
        _databaseService.getNewDocumentId(collectionPath: kCollection);
    // Create booking object
    final DeskBooking booking = DeskBooking(
        memberId: uid,
        id: docId,
        workspaceId: hotDesk.workspaceId,
        deskId: hotDesk.deskId,
        deskNumber: hotDesk.number,
        startTime: startDateTime,
        endTime: endDateTime,
        status: BookingStatus.confirmed,
        type: BookingType.desk);
    // Set booking to db
    await _databaseService.setNewBooking(booking: booking);
    // return booking
    return booking;
  }

  Future<MeetingRoomBooking> bookMeetingRoom({
    required DateTime startTime,
    required DateTime endTime,
    required MeetingRoom meetingRoom,
  }) async {
    try {
      // Get uid
      final String uid = _authenticationService.uid;
      // Check user is active member
      final isClient = await _authenticationService.isClient(true);
      if (!isClient) {
        throw Exception(
            'You need to have an active subscription to book a meeting room');
      }
      // Add booking object to database
      final docId =
          _databaseService.getNewDocumentId(collectionPath: kCollection);
      final MeetingRoomBooking booking = MeetingRoomBooking(
        memberId: uid,
        id: docId,
        workspaceId: '0001',
        roomId: meetingRoom.id,
        startTime: startTime,
        endTime: endTime,
        status: BookingStatus.confirmed,
        type: BookingType.meetingRoom,
        roomName: meetingRoom.name,
      );
      // Set booking to db
      await _databaseService.setNewBooking(booking: booking);
      // return booking
      return booking;

      // return booking object
    } catch (error) {
      _logger.w(error);
      rethrow;
    }
  }

  Future<List<Booking>> fetchUserBookings() async {
    try {
      _logger.v('Fetching bookings for user');
      // Get uid
      final String uid = _authenticationService.uid;
      _logger.v('uid: $uid');
      // Fetch all bookings for uid
      final bookings = _databaseService.fetchBookings(uid: uid);
      return bookings;
    } catch (error) {
      _logger.w(error);
      rethrow;
    }
  }

  /// Fetches all bookings for type. If type is null, fetches all bookings.
  Future<List<Booking>> fetchAllBookings({required BookingType? type}) async {
    _logger.v('fetching all bookings. type: $type');
    try {
      switch (type) {
        case BookingType.desk:
          final data = await _databaseService.fetchConfirmedDeskBookings();
          return data;
        case BookingType.meetingRoom:
          final data =
              await _databaseService.fetchConfirmedMeetingRoomBookings();
          return data;
        default:
          throw UnimplementedError('Not implemented for type: $type');
      }
    } catch (error) {
      _logger.w('error: ${error.toString()}');
      rethrow;
    }
  }

  Future<void> cancelBooking(Booking booking) async {
    try {
      _logger.v('Cancelling booking ${booking.id}');
      await _databaseService.cancelBooking(bookingId: booking.id);
    } catch (error) {
      _logger.w('Error cancelling booking: ${error.toString()}');
      rethrow;
    }
  }
}
