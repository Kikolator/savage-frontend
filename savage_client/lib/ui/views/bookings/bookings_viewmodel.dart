import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/services/booking_service.dart';
import 'package:stacked/stacked.dart';

class BookingsViewModel extends BaseViewModel {
  final _bookingService = locator<BookingService>();
  bool _showUpcoming = true;
  bool get showUpcoming => _showUpcoming;

  List<Booking> _bookings = [];
  List<Booking> _filteredBookings = [];
  List<Booking> get bookings => _filteredBookings;

  void selectUpcoming() {
    _filteredBookings = _bookings
        .toList()
        .where((e) => e.startDateTime.isAfter(DateTime.now()))
        .toList();
    _showUpcoming = true;
    rebuildUi();
  }

  void selectPast() {
    _filteredBookings = _bookings
        .toList()
        .where((e) => e.startDateTime.isBefore(DateTime.now()))
        .toList();
    _showUpcoming = false;
    rebuildUi();
  }

  Future<void> fetchBookings() async {
    _bookings = await _bookingService.fetchBookings();
    _filteredBookings = _bookings
        .toList()
        .where((e) => e.startDateTime.isAfter(DateTime.now()))
        .toList();
    rebuildUi();
  }

  Future<void> cancelBooking(Booking booking) async {
    // TODO Show confirmation dialog
    // TODO cancel booking
    // TODO remove booking from list
  }
}
