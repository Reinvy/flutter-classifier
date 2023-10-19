import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:classifier/api/image_api.dart';

final imageResultProvider = StateProvider.autoDispose<String?>((ref) => null);
final isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
final imageProvider = StateProvider.autoDispose<XFile?>((ref) => null);

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
