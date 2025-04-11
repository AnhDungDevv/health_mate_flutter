// domain/repositories/banner_repository.dart
import 'package:health_mate/src/home/doamin/entity/banner_entity.dart';

abstract class BannerRepository {
  List<BannerEntity> getBanners();
}
