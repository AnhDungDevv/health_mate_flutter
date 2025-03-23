import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/profile/data/repository/profile_repository_impl.dart';
import 'package:health_mate/src/profile/data/source/profile_remote_source.dart';
import 'package:health_mate/src/profile/domain/usecase/upload_usecase.dart';
import 'package:health_mate/src/profile/presentaion/notifier/avatar_notifier.dart';

final profileRemoteSourceProvider =
    Provider<ProfileRemoteSourceImpl>((ref) => ProfileRemoteSourceImpl());

final profilerepository = Provider<ProfileRepositoryImpl>((ref) =>
    ProfileRepositoryImpl(
        profileRemoteSource: ref.read(profileRemoteSourceProvider)));

final avatarUsecase = Provider<UploadAvatarUseCase>((ref) {
  return UploadAvatarUseCase(repository: ref.read(profilerepository));
});

final avatarProvider =
    StateNotifierProvider<AvatarNotifier, AsyncValue<String?>>((ref) {
  return AvatarNotifier(uploadAvatarUseCase: ref.read(avatarUsecase));
});
