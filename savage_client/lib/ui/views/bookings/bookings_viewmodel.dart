import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/services/booking_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BookingsViewModel extends BaseViewModel {
  final _logger = getLogger('BookingsViewModel');
  final _bookingService = locator<BookingService>();
  final _dialogService = locator<DialogService>();
  bool _showUpcoming = true;
  bool get showUpcoming => _showUpcoming;

  List<Booking> _bookings = [];
  List<Booking> _filteredBookings = [];
  List<Booking> get bookings => _filteredBookings;
  // List<DeskBooking> get deskBookings =>
  //     _filteredBookings.whereType<DeskBooking>().toList();
  // List<MeetingRoomBooking> get meetingRoomBookings =>
  //     _filteredBookings.whereType<MeetingRoomBooking>().toList();

  void selectUpcoming() {
    _filteredBookings = _bookings
        .toList()
        .where((e) =>
            e.startTime.isAfter(DateTime.now()) &&
            (e.status == BookingStatus.completed ||
                e.status == BookingStatus.confirmed ||
                e.status == BookingStatus.pending))
        .toList();
    _showUpcoming = true;
    rebuildUi();
  }

  void selectPast() {
    _filteredBookings = _bookings
        .toList()
        .where((e) =>
            e.startTime.isBefore(DateTime.now()) &&
            (e.status == BookingStatus.completed ||
                e.status == BookingStatus.confirmed ||
                e.status == BookingStatus.pending))
        .toList();
    _showUpcoming = false;
    rebuildUi();
  }

  Future<void> fetchBookings() async {
    _bookings = await _bookingService.fetchUserBookings();
    _bookings.sort((a, b) => a.startTime.compareTo(b.startTime));
    _filteredBookings = _bookings
        .where(
          (e) =>
              e.startTime.isAfter(DateTime.now()) &&
              (e.status == BookingStatus.completed ||
                  e.status == BookingStatus.confirmed ||
                  e.status == BookingStatus.pending),
        )
        .toList();
    rebuildUi();
  }

  Future<void> cancelBooking(Booking booking) async {
    try {
      setError(null);
      _logger.d('canceling booking: ${booking.id}');
      // Show confirmation dialog
      final dialogResponse = await _dialogService.showConfirmationDialog(
        title: 'Cancel booking',
        description: 'Are you sure you want to cancel this booking?',
        confirmationTitle: 'Yes',
        cancelTitle: 'No',
      );
      if (dialogResponse != null && dialogResponse.confirmed) {
        _logger.v('Booking cancellation confirmed by user');
        setBusy(true);
        // cancel booking
        await _bookingService.cancelBooking(booking);
        _logger.v('Fetching bookings');
        await fetchBookings();
      } else {
        _logger.v('Booking not cancelled');
      }
    } catch (error) {
      _logger.e('Error cancelling booking: ${error.toString()}');
      setError(
          'Oops! Something went wrong cancelling your booking. Please try again. Contact your Savage Coworking team if the problem persists.');
    } finally {
      setBusy(false);
    }
  }
}
