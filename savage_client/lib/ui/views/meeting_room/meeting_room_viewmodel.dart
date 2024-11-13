import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savage_client/app/app.dialogs.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/enums/booking_type.dart';
import 'package:savage_client/data/meeting_room.dart';
import 'package:savage_client/data/meeting_room_booking.dart';
import 'package:savage_client/services/booking_service.dart';
import 'package:savage_client/services/meeting_room_service.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MeetingRoomViewModel extends BaseViewModel {
  final _logger = getLogger('MeetingRoomViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _bookingService = locator<BookingService>();
  final _routerService = locator<RouterService>();
  final _snackbarService = locator<SnackbarService>();
  final _meetingRoomService = locator<MeetingRoomService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  List<MeetingRoom> _meetingRooms = [];
  List<MeetingRoom> _filteredMeetingRooms = [];
  List<MeetingRoom> get meetingRooms => _filteredMeetingRooms;

  List<MeetingRoomBooking> _confirmedBookings = [];

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

  Future<void> _fetchMeetingRooms() async {
    _logger.v('fetching meeting rooms');
    _meetingRooms = await _meetingRoomService.fetchAvailableMeetingRooms();
  }

  Future<void> _fetchBookings() async {
    _confirmedBookings = await _bookingService.fetchAllBookings(
        type: BookingType.meetingRoom) as List<MeetingRoomBooking>;
  }

  Future<void> initializeModel() async {
    try {
      setBusy(true);
      _isAdmin = await _userService.isAdmin();
      await _fetchMeetingRooms();
      await _fetchBookings();
      _filterMeetingRooms();
    } catch (error) {
      _logger.e(error);
      setError(error.toString());
    } finally {
      setBusy(false);
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

  /// A helper function that removes meeting rooms from the meeting room list
  /// based on start and end date time
  void _filterMeetingRooms() {
    _logger.v('filtering meeting rooms');
    _filteredMeetingRooms = _meetingRooms.where((meetingRoom) {
      // Check if any booking on the desk overlaps with the chosen start and end time
      _logger.v('desk id: ${meetingRoom.id}');
      return !_confirmedBookings.any((booking) {
        // A booking overlaps if it starts before the chosen end time
        // and ends after the chosen start time
        _logger.v(
            'booking id: ${booking.id},desk id: ${booking.roomId}, remove: ${booking.roomId == meetingRoom.id && booking.startTime.isBefore(_endDateTime) && booking.endTime.isAfter(_startDateTime)}');
        return booking.roomId == meetingRoom.id &&
            booking.startTime.isBefore(_endDateTime) &&
            booking.endTime.isAfter(_startDateTime);
      });
    }).toList();
  }

  Future<void> bookMeetingRoom(MeetingRoom meetingRoom) async {
    try {
      setError(null);
      final response = await _bottomSheetService.showBottomSheet(
        title: 'Your Booking:',
        description:
            'Your meeting room: ${meetingRoom.name}, from ${DateFormat.MMMMEEEEd().add_Hm().format(_startDateTime)} to ${DateFormat.MMMMEEEEd().add_Hm().format(_endDateTime)}',
        confirmButtonTitle: 'Confirm',
        cancelButtonTitle: 'Cancel',
      );

      if (response != null && response.confirmed) {
        setBusy(true);
        await _bookingService.bookMeetingRoom(
            meetingRoom: meetingRoom,
            startTime: _startDateTime,
            endTime: _endDateTime);
        _routerService.navigateToBookingsView();
        _snackbarService.showSnackbar(
          title: 'Confirmed',
          message: 'Your Meeting Room is confirmed. See you soon!',
          duration: const Duration(seconds: 3),
        );
      } else {
        _logger.v('booking cancelled');
      }
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  Future<void> addMeetingRoom() async {
    try {
      final dialogResponse = await _dialogService.showCustomDialog(
          variant: DialogType.addMeetingRoom);
      if (dialogResponse != null && dialogResponse.confirmed) {
        _snackbarService.showSnackbar(
            message: 'Meeting room added successfully!');
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
      _filterMeetingRooms();
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
      _filterMeetingRooms();
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
      _filterMeetingRooms();
    }
  }
}
