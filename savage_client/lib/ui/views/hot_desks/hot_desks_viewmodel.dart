import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/services/booking_service.dart';
import 'package:savage_client/services/desks_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DesksViewModel extends BaseViewModel {
  final _desksService = locator<DesksService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _bookingService = locator<BookingService>();
  final _routerService = locator<RouterService>();
  final _snackbarService = locator<SnackbarService>();

  List<Desk> _hotDesks = [];
  List<Desk> _filteredHotDesks = [];
  List<Desk> get hotDesks => _filteredHotDesks;

  // sets start date to nearest half hour.
  DateTime _startDateTime = DateTime.now()
      .add(Duration(minutes: (30 - (DateTime.now().minute % 30)) % 30));
  DateTime get startDateTime => _startDateTime;

  // start date + 1 hour.
  DateTime _endDateTime = DateTime.now().add(
      Duration(hours: 1, minutes: (30 - (DateTime.now().minute % 30)) % 30));
  DateTime get endDateTime => _endDateTime;

  String _durationString = 'an hour';
  String get durationString => _durationString;

  final BoardDateTimeTextController _startDateTimeTextController =
      BoardDateTimeTextController();
  BoardDateTimeTextController get startDateTimeTextController =>
      _startDateTimeTextController;

  final BoardDateTimeTextController _endDateTimeTextController =
      BoardDateTimeTextController();
  BoardDateTimeTextController get endDateTimeTextController =>
      _endDateTimeTextController;

  Future<void> fetchHotDesks() async {
    _hotDesks = await _desksService.fetchAvailableHotDesks();
    _filterHotDesks();
    rebuildUi();
  }

  Future<void> bookDesk(Desk hotDesk) async {
    final response = await _bottomSheetService.showBottomSheet(
      title: 'Your Booking:',
      description:
          'Your desk number: ${hotDesk.number}, from ${_startDateTime.day}/${_startDateTime.month}/${_startDateTime.year} ${_startDateTime.hour}:${_startDateTime.minute} to ${_endDateTime.day}/${_endDateTime.month}/${_endDateTime.year} ${_endDateTime.hour}:${_endDateTime.minute}',
      confirmButtonTitle: 'Confirm',
      cancelButtonTitle: 'Cancel',
    );

    if (response != null && response.confirmed) {
      try {
        setBusy(true);
        await _bookingService.bookDesk(
            hotDesk: hotDesk,
            startDateTime: _startDateTime,
            endDateTime: _endDateTime);
        _routerService.navigateToBookingsView();
        _snackbarService.showSnackbar(
          title: 'Confirmed',
          message: 'Your hot desk is confirmed. See you soon!',
          duration: const Duration(seconds: 3),
        );
      } catch (error) {
        UnimplementedError('Need to handle errors on bookDesk()');
      } finally {
        setBusy(false);
      }
    }
  }

  /// A helper function to rebuild the UI when start or end datetime is chagned
  void _rebuildDateTimeUi() {
    if (_endDateTime.difference(_startDateTime) < const Duration(minutes: 30)) {
      _endDateTime = _startDateTime.add(const Duration(hours: 1));
      _durationString = 'an hour';
      _endDateTimeTextController.setDate(_endDateTime);
    } else {
      final dateTimeDifference = _endDateTime.difference(_startDateTime);
      if (dateTimeDifference < const Duration(hours: 1)) {
        _durationString = '${dateTimeDifference.inMinutes} minutes';
      } else {
        _durationString =
            '${dateTimeDifference.inHours} hours ${dateTimeDifference.inMinutes - dateTimeDifference.inHours * 60} minutes';
      }
    }
    rebuildUi();
  }

  /// A helper function that removes desks from the hot desk list
  /// based on start and end date time
  void _filterHotDesks() {
    _filteredHotDesks = _hotDesks.toList();
    _filteredHotDesks.removeWhere((desk) {
      return desk.bookings.any((booking) =>
          (booking.startDateTime.isBefore(_endDateTime) &&
              booking.endDateTime.isAfter(_startDateTime)) ||
          (booking.startDateTime.isBefore(_startDateTime) &&
              booking.endDateTime.isAfter(_startDateTime)));
    });
  }

  void changeStartDateTime(DateTime value) async {
    // TODO Implement search on free Hot desks for that time
    _startDateTime = value;
    _rebuildDateTimeUi();
    _filterHotDesks();
  }

  void changeEndDateTime(DateTime value) async {
    // TODO Implement search on free Hot desks for that time
    _endDateTime = value;
    _rebuildDateTimeUi();
    _filterHotDesks();
  }
}
