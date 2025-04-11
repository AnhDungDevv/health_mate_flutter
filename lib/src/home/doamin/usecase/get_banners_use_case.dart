// domain/usecases/get_banners_use_case.dart
import 'package:health_mate/src/home/doamin/entity/banner_entity.dart';
import 'package:health_mate/src/home/doamin/repos/banner_repository.dart';

class GetBannersUseCase {
  final BannerRepository repository;

  GetBannersUseCase(this.repository);

  List<BannerEntity> call() {
    return repository.getBanners();
  }
}
