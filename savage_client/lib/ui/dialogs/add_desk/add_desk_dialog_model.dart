import 'package:image_picker/image_picker.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';
import 'package:savage_client/services/dependency_wrappers/storage_service.dart';
import 'package:savage_client/services/desks_service.dart';
import 'package:savage_client/ui/dialogs/add_desk/add_desk_dialog.form.dart';
import 'package:stacked/stacked.dart';

class AddDeskDialogModel extends FormViewModel {
  final _logger = getLogger('AddDeskDialogModel');
  final _desksService = locator<DesksService>();
  final _storageService = locator<StorageService>();
  final _databaseService = locator<DatabaseService>();
  XFile? _photo;

  String? _succesMessage;
  String? get succesMessage => _succesMessage;

  Future<void> addDesk() async {
    try {
      setBusy(true);
      setError(null);
      _logger.d('adding new desk');
      validateForm();
      if (numberValue == null || typeValue == null || availableValue == null) {
        _logger.e(
            'Invalid desk object. Number Value: $numberValue, Type Value: $typeValue, Available Value: $availableValue');
        throw Exception('Invalid desk object');
      }
      // get new unique id
      final deskId = _databaseService.getNewDocumentId(
          collectionPath: DatabaseService.kDesksCollectionPath);
      // upload desk pic to storage
      String? photoUrl;
      if (_photo != null) {
        photoUrl = await _storageService.uploadDeskPicture(
            deskId: deskId, file: _photo!);
      }
      final Desk desk = Desk(
        deskId: deskId,
        workspaceId: '0001',
        number: numberValue!,
        type: typeValue!,
        available: availableValue! == 'true',
        assignedTo: assignedToValue != null
            ? assignedToValue!.isEmpty
                ? null
                : assignedToValue
            : null,
        assignedUntil: assignedUntilValue,
        bookings: [],
        photoUrl: photoUrl,
      );
      await _desksService.addDesk(desk: desk);
      _succesMessage = 'Desk added successfully!';
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
