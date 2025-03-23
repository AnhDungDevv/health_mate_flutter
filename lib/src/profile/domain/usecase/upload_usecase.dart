import 'dart:io';

import 'package:health_mate/src/profile/domain/repository/profile_repository.dart';

class UploadAvatarUseCase {
  final ProfileRepository repository;

  UploadAvatarUseCase({required this.repository});

  Future<String> uploadImage(File file) {
    return repository.uploadImage(file);
  }

  Future<String> uploadFile(File file) {
    return repository.uploadFile(file);
  }
}
