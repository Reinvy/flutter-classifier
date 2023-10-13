import 'package:classifier/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageApi {
  final dio = Dio();

  Future<String> predictImage(XFile file) async {
    try {
      print("12");
      final FormData data = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
        ),
      });
      Response result = await dio.post(
        "$baseUrl/images",
        data: data,
      );
      print("object");
      return result.data["return"];
    } catch (e) {
      rethrow;
    }
  }
}
