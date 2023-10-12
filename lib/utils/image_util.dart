import 'package:classifier/api/image_api.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtil {
  final imagePicker = ImagePicker();
  final imageApi = ImageApi();

  Future<XFile?> pickImage() async {
    try {
      return imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 720,
        maxWidth: 720,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future imageClassification(XFile xFile) async {
    try {
      final result = await imageApi.predictImage(xFile);
      return result;
    } catch (e) {
      return "Error";
    }
  }
}
