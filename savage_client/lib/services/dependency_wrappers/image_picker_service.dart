import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<XFile?> pickImage() async {
    XFile? xFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        preferredCameraDevice: CameraDevice.front,
        maxHeight: 1024,
        maxWidth: 1024,
        imageQuality: 50);
    return xFile;
  }
}
