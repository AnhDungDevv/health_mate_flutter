import 'dart:io';

import 'package:health_mate/src/profile/data/source/profile_remote_source.dart';
import 'package:health_mate/src/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteSource profileRemoteSource;
  ProfileRepositoryImpl({required this.profileRemoteSource});
  @override
  Future<String> uploadImage(File file) {
    return profileRemoteSource.uploadImage(file);
  }

  @override
  Future<String> uploadFile(File file) {
    return profileRemoteSource.uploadFile(file);
  }
}
