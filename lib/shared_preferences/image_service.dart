import 'package:image_picker/image_picker.dart';

class ImageService {
  static Future<String?> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile?.path;
  }
}
