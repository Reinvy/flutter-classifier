import 'package:classifier/constants.dart';
import 'package:dio/dio.dart';

class HateSpeechApi {
  final dio = Dio();

  Future<String> predictHateSpeech(String text) async {
    try {
      Map data = {"text": text};
      Response result = await dio.post(
        "$baseUrl/images",
        data: data,
      );
      return result.data["return"];
    } catch (e) {
      rethrow;
    }
  }
}
