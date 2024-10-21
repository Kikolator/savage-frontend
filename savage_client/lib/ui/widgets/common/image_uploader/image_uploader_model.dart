import 'package:image_picker/image_picker.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/services/dependency_wrappers/image_picker_service.dart';
import 'package:stacked/stacked.dart';

class ImageUploaderModel extends BaseViewModel {
  final void Function(XFile)? onImageSelected;

  final _imagePickerService = locator<ImagePickerService>();

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  XFile? _imageFile;
  XFile? get imageFile => _imageFile;

  ImageUploaderModel(this._imageUrl, this._imageFile, this.onImageSelected);

  Future selectImageFile() async {
    XFile? file = await _imagePickerService.pickImage();
    if (file != null) {
      _imageFile = file;
      onImageSelected?.call(file);
      rebuildUi();
    }
  }
}
