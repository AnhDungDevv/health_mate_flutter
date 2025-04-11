import 'package:health_mate/src/home/data/mapper/recommended_consultant_mapper.dart';
import 'package:health_mate/src/home/data/sources/recommended_consultant_remote_source.dart';
import 'package:health_mate/src/home/doamin/entity/recommended_consultant_entity.dart';
import 'package:health_mate/src/home/doamin/repos/recommended_consultant_repository.dart';

class RecommendedConsultantRepositoryImpl
    implements IRecommendedConsultantRepository {
  final RecommendedConsultantRemoteSource remoteSource;

  RecommendedConsultantRepositoryImpl(this.remoteSource);

  @override
  Future<List<ConsultantPreviewEntity>> getRecommendedConsultants() async {
    final models = await remoteSource.fetchRecommendedConsultants();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ConsultantPreviewEntity>> getTopConsultants() async {
    final models = await remoteSource.fetchTopRatedConsultants();
    return models.map((e) => e.toEntity()).toList();
  }
}
