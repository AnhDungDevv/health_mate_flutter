import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/profile/domain/usecase/upload_usecase.dart';
import 'package:image_picker/image_picker.dart';

class AvatarNotifier extends StateNotifier<AsyncValue<String?>> {
  final UploadAvatarUseCase uploadAvatarUseCase;
  final ImagePicker _picker = ImagePicker();

  AvatarNotifier({required this.uploadAvatarUseCase})
      : super(const AsyncValue.data(null));

  Future<String?> uploadImage(File imageFile) async {
    try {
      state = const AsyncValue.loading();
      final imageUrl = await uploadAvatarUseCase.uploadImage(imageFile);
      state = AsyncValue.data(imageUrl);
      return imageUrl;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return null;
    }
  }

  Future<void> pickImage({bool fromCamera = false}) async {
    try {
      state = const AsyncValue.loading();
      final pickedFile = await _picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );

      if (pickedFile != null) {
        final imageFile = File(pickedFile.path);
        await uploadImage(imageFile);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void removeImage() {
    state = const AsyncValue.data(null);
  }
}
