import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<XFile?> pickImage() async {
    XFile? xFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, preferredCameraDevice: CameraDevice.front);
    return xFile;
  }
}
