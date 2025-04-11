import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/home/doamin/entity/banner_entity.dart';
import 'package:health_mate/src/home/doamin/usecase/get_banners_use_case.dart';

class BannerNotifier extends StateNotifier<AsyncValue<List<BannerEntity>>> {
  final GetBannersUseCase useCase;

  BannerNotifier(this.useCase) : super(const AsyncLoading()) {
    getBanners();
  }

  Future<void> getBanners() async {
    try {
      final banners = useCase();
      state = AsyncValue.data(banners);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
