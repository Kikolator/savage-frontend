import 'package:image_picker/image_picker.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/meeting_room.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';
import 'package:savage_client/services/dependency_wrappers/storage_service.dart';
import 'package:savage_client/services/meeting_room_service.dart';
import 'package:savage_client/ui/dialogs/add_meeting_room/add_meeting_room_dialog.form.dart';
import 'package:stacked/stacked.dart';

class AddMeetingRoomDialogModel extends FormViewModel {
  final _logger = getLogger('AddMeetingRoomDialogModel');
  final _meetingRoomService = locator<MeetingRoomService>();
  final _storageService = locator<StorageService>();
  final _databaseService = locator<DatabaseService>();

  XFile? _photo;

  String? _succesMessage;
  String? get succesMessage => _succesMessage;

  Future<void> addMeetingRoom() async {
    try {
      setBusy(true);
      setError(null);
      _logger.d('adding new meeting room');
      validateForm();
      if (nameValue == null ||
          capacityValue == null ||
          descriptionValue == null) {
        _logger.e(
            'Invalid Meeting Room object. name Value: $nameValue, capacity Value: $capacityValue, description Value: $descriptionValue');
        throw Exception('Invalid meeting room object');
      } else if (_photo == null) {
        throw Exception('Photo is null');
      }
      // get new unique id
      final meetingRoomId = _databaseService.getNewDocumentId(
          collectionPath: DatabaseService.kMeetingRoomCollectionPath);
      // upload meeting room pic to storage
      String photoUrl = await _storageService.uploadMeetingRoomPicture(
          meetingRoomId: meetingRoomId, file: _photo!);

      final MeetingRoom room = MeetingRoom(
        id: meetingRoomId,
        name: nameValue!,
        description: descriptionValue!,
        photoUrl: photoUrl,
        capacity: int.parse(capacityValue!),
        active: activeValue! == 'true',
        bookings: [],
      );
      await _meetingRoomService.addMeetingRoom(meetingRoom: room);
      _succesMessage = 'Meeting room added successfully!';
    } catch (error) {
      _logger.e(error);
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  void onImageSelected(XFile file) {
    _photo = file;
  }
}
