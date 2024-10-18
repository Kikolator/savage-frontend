import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';

class BookingService {
  static const kCollection = 'bookings';

  final _databaseService = locator<DatabaseService>();
  final _authenticationService = locator<AuthenticationService>();

  Future<Booking> bookDesk(
      {required DateTime startDateTime,
      required DateTime endDateTime,
      required Desk hotDesk}) async {
    // TODO check membership status
    // TODO check desk is available
    // Get uid
    final String uid = _authenticationService.uid;
    // Get new doc id
    final docId =
        _databaseService.getNewDocumentId(collectionPath: kCollection);
    // Create booking object
    final Booking booking = Booking(
        userId: uid,
        bookingId: docId,
        workspaceId: hotDesk.workspaceId,
        deskId: hotDesk.deskId,
        deskNumber: hotDesk.number,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        status: BookingStatus.confirmed);
    // Set booking to db
    await _databaseService.setNewBooking(booking: booking);
    // return booking
    return booking;
  }

  Future<List<Booking>> fetchBookings() async {
    // Get uid
    final String uid = _authenticationService.uid;
    // Get bookings for uid
    final bookings = _databaseService.fetchBookings(uid: uid);
    return bookings;
  }
}
