// data/repo_impl/banner_repository_impl.dart
import 'package:health_mate/src/home/data/models/banner_model.dart';
import 'package:health_mate/src/home/data/sources/banner_local_source.dart';
import 'package:health_mate/src/home/doamin/entity/banner_entity.dart';
import 'package:health_mate/src/home/doamin/repos/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerLocalSource localSource;

  BannerRepositoryImpl(this.localSource);

  @override
  List<BannerEntity> getBanners() {
    return localSource.getBanners().map((e) => e.toEntity()).toList();
  }
}
