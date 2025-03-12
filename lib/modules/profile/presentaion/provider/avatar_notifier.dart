import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AvatarNotifier extends StateNotifier<File?> {
  AvatarNotifier() : super(null);
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio(); // Initialize Dio instance

  Future<String?> uploadImage(File imageFile) async {
    final String url = 'https://yourserver.com/upload';
    return 'abc';
    // try {
    //   FormData formData = FormData.fromMap({
    //     'file': await MultipartFile.fromFile(imageFile.path,
    //         filename: imageFile.uri.pathSegments.last),
    //   });

    //   Response response = await _dio.post(url, data: formData);

    //   if (response.statusCode == 200) {
    //     final data = response.data;
    //     return data['url'];
    //   } else {
    //     return null;
    //   }
    // } catch (e) {
    //   print('Error uploading image: $e');
    //   return null;
    // }
  }

  Future<void> pickImage({bool fromCamera = false}) async {
    final pickedFile = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      state = imageFile;
    }
  }

  void removeImage() {
    state = null;
  }
}
