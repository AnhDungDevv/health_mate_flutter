import 'dart:io';

import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';

abstract class ProfileRemoteSource {
  Future<String> uploadImage(File imageFile);
  Future<String> uploadFile(File file);
}

class ProfileRemoteSourceImpl implements ProfileRemoteSource {
  final Dio _dio = ApiClient().dio;

  @override
  Future<String> uploadImage(File imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: imageFile.uri.pathSegments.last),
      });

      Response response = await _dio.post('upload_image', data: formData);

      if (response.statusCode == 200) {
        final data = response.data;
        return data['url'];
      } else {
        throw Exception("Upload image failed: Unexpected response");
      }
    } catch (e) {
      throw Exception("Upload image failed: $e");
    }
  }

  @override
  Future<String> uploadFile(File file) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path,
            filename: file.uri.pathSegments.last),
      });

      Response response = await _dio.post('/upload-file', data: formData);

      if (response.statusCode == 200) {
        return response.data['url'];
      } else {
        throw Exception("Upload file failed: Unexpected response");
      }
    } catch (e) {
      throw Exception("Upload file failed: $e");
    }
  }
}
