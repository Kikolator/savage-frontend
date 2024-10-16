import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/services/desks_service.dart';
import 'package:stacked/stacked.dart';

class DesksViewModel extends BaseViewModel {
  final _desksService = locator<DesksService>();

  List<Desk> _hotDesks = [];
  List<Desk> get hotDesks => _hotDesks;

  // sets start date to nearest half hour.
  DateTime _startDateTime = DateTime.now()
      .add(Duration(minutes: (30 - (DateTime.now().minute % 30)) % 30));
  DateTime get startDateTime => _startDateTime;

  // start date + 1 hour.
  DateTime _endDateTime = DateTime.now().add(
      Duration(hours: 1, minutes: (30 - (DateTime.now().minute % 30)) % 30));
  DateTime get endDateTime => _endDateTime;

  Future<void> fetchHotDesks() async {
    _hotDesks = await _desksService.fetchAvailableHotDesks();
    rebuildUi();
  }

  Future<void> bookDesk(Desk hotDesk) async {
    // TODO Show bottom sheet confirming booking.
  }

  void changeStartDateTime(DateTime value) {
    // Implement search on free Hot desks for that time
    _startDateTime = value;
    rebuildUi();
  }

  void changeEndDateTime(DateTime value) {
    // Implement search on free Hot desks for that time
    _endDateTime = value;
    rebuildUi();
  }
}
