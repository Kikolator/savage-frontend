import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savage_client/app/app.dialogs.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/data/desk_booking.dart';
import 'package:savage_client/data/enums/booking_type.dart';
import 'package:savage_client/data/exceptions/booking_exception.dart';
import 'package:savage_client/services/booking_service.dart';
import 'package:savage_client/services/desks_service.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DesksViewModel extends BaseViewModel {
  final _logger = getLogger('DesksViewModel');
  final _desksService = locator<DesksService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _bookingService = locator<BookingService>();
  final _routerService = locator<RouterService>();
  final _snackbarService = locator<SnackbarService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  List<Desk> _hotDesks = [];
  List<Desk> _filteredHotDesks = [];
  List<Desk> get hotDesks => _filteredHotDesks;

  List<DeskBooking> _confirmedBookings = [];

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

  // final BoardDateTimeTextController _startDateTimeTextController =
  //     BoardDateTimeTextController();
  // BoardDateTimeTextController get startDateTimeTextController =>
  //     _startDateTimeTextController;

  // final BoardDateTimeTextController _endDateTimeTextController =
  //     BoardDateTimeTextController();
  // BoardDateTimeTextController get endDateTimeTextController =>
  //     _endDateTimeTextController;

  Future<void> _fetchHotDesks() async {
    _hotDesks = await _desksService.fetchAvailableHotDesks();
  }

  Future<void> _fetchBookings() async {
    _confirmedBookings = await _bookingService.fetchAllBookings(
        type: BookingType.desk) as List<DeskBooking>;
  }

  Future<void> initialiseModel() async {
    try {
      setBusy(true);
      _isAdmin = await _userService.isAdmin();
      await _fetchHotDesks();
      await _fetchBookings();
      _filterHotDesks();
    } catch (error) {
      _logger.e(error);
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  Future<void> bookDesk(Desk hotDesk) async {
    final response = await _bottomSheetService.showBottomSheet(
      title: 'Your Booking:',
      description:
          'Desk number: ${hotDesk.number}, from ${DateFormat.MMMMEEEEd().add_Hm().format(_startDateTime)} to ${DateFormat.MMMMEEEEd().add_Hm().format(_endDateTime)}',
      confirmButtonTitle: 'Confirm',
      cancelButtonTitle: 'Cancel',
    );

    if (response != null && response.confirmed) {
      try {
        setBusy(true);
        setError(null);
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
        _logger.e(error);
        if (error is BookingException) {
          switch (error.code) {
            case (BookingException.noClient):
              setError(error.message);
            default:
              setError(error.message);
          }
        } else {
          setError(error.toString());
        }
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
    _logger.v('filtering hot desks: ${_hotDesks.length}');
    _filteredHotDesks = _hotDesks.where((desk) {
      // Check if any booking on the desk overlaps with the chosen start and end time
      _logger.v('desk id: ${desk.deskId}');
      return !_confirmedBookings.any((booking) {
        // A booking overlaps if it starts before the chosen end time
        // and ends after the chosen start time
        _logger.v(
            'booking id: ${booking.id},desk id: ${booking.deskId}, remove: ${booking.deskId == desk.deskId && booking.startTime.isBefore(_endDateTime) && booking.endTime.isAfter(_startDateTime)}');
        return booking.deskId == desk.deskId &&
            booking.startTime.isBefore(_endDateTime) &&
            booking.endTime.isAfter(_startDateTime);
      });
    }).toList();
  }

  Future<void> addDesk() async {
    try {
      final dialogResponse =
          await _dialogService.showCustomDialog(variant: DialogType.addDesk);
      if (dialogResponse != null && dialogResponse.confirmed) {
        _snackbarService.showSnackbar(message: 'Desk added successfully!');
      }
    } catch (error) {
      setError(error);
    } finally {
      setBusy(false);
    }
  }

  Future<void> selectNewDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: startDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 90),
      ),
    );
    if (date != null) {
      _startDateTime = DateTime(date.year, date.month, date.day, 9);
      _endDateTime = _startDateTime.add(const Duration(hours: 1));
      _rebuildDateTimeUi();
      _filterHotDesks();
    }
  }

  Future<void> selectNewStartTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(startDateTime),
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (time != null) {
      // Set new time on start date time object
      _startDateTime = DateTime(
        startDateTime.year,
        startDateTime.month,
        startDateTime.day,
        time.hour,
        time.minute,
      );
      // set end date time object if start time is after end time
      if (_startDateTime.isAfter(_endDateTime)) {
        _endDateTime = _startDateTime.add(const Duration(hours: 1));
      }
      // Rebuild UI and filter desks
      _rebuildDateTimeUi();
      _filterHotDesks();
    }
  }

  Future<void> selectNewEndTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(endDateTime),
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (time != null) {
      // Set new time on start date time object
      _endDateTime = DateTime(
        endDateTime.year,
        endDateTime.month,
        endDateTime.day,
        time.hour,
        time.minute,
      );
      // set end date time object if start time is after end time
      if (_endDateTime.isBefore(_startDateTime)) {
        _startDateTime = _endDateTime.subtract(const Duration(hours: 1));
      }
      // Rebuild UI and filter desks
      _rebuildDateTimeUi();
      _filterHotDesks();
    }
  }
}
