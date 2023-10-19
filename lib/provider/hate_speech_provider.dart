import 'package:classifier/api/hate_speech_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final hateSpeechResultProvider =
    StateProvider.autoDispose<String?>((ref) => null);
final isLoadingHSProvider = StateProvider.autoDispose<bool>((ref) => false);
final hateSpeechProvider = StateProvider.autoDispose<XFile?>((ref) => null);

class HateSpeechUtil {
  final hateSpeechApi = HateSpeechApi();

  Future hateSpeechDetection(String text) async {
    try {
      final result = await hateSpeechApi.predictHateSpeech(text);
      return result;
    } catch (e) {
      return "Error";
    }
  }
}
