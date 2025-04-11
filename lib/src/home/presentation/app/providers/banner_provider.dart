// presentation/providers/banner_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/home/data/repos/banner_repo_impl.dart';
import 'package:health_mate/src/home/data/sources/banner_local_source.dart';
import 'package:health_mate/src/home/doamin/entity/banner_entity.dart';
import 'package:health_mate/src/home/doamin/usecase/get_banners_use_case.dart';
import 'package:health_mate/src/home/presentation/app/notifiers/banner_notifier.dart';

// Khởi tạo source và repo
final bannerLocalSourceProvider = Provider((_) => BannerLocalSource());

final bannerRepositoryProvider = Provider(
  (ref) => BannerRepositoryImpl(ref.read(bannerLocalSourceProvider)),
);

final getBannersUseCaseProvider = Provider(
  (ref) => GetBannersUseCase(ref.read(bannerRepositoryProvider)),
);

final bannerNotifierProvider =
    StateNotifierProvider<BannerNotifier, AsyncValue<List<BannerEntity>>>(
  (ref) {
    final useCase = ref.watch(getBannersUseCaseProvider);
    return BannerNotifier(useCase);
  },
);
