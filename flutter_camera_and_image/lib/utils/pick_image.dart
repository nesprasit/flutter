import 'package:image_picker/image_picker.dart';

class PickerImage {
  static final ImagePicker _picker = ImagePicker();

  static pickerGallery({
    double maxWidth,
    double maxHeight,
    int imageQuality,
  }) async {
    return await _picker.getImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality);
  }

  static takeCamera({
    double maxWidth,
    double maxHeight,
    int imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    return await _picker.getImage(
        source: ImageSource.camera,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
        preferredCameraDevice: preferredCameraDevice);
  }
}
