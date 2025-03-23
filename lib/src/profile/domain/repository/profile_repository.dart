import 'dart:io';

abstract class ProfileRepository {
  Future<String> uploadImage(File file);
  Future<String> uploadFile(File file);
}
