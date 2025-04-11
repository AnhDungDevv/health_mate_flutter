import 'package:health_mate/src/home/doamin/entity/recommended_consultant_entity.dart';

abstract class IRecommendedConsultantRepository {
  Future<List<ConsultantPreviewEntity>> getRecommendedConsultants();
  Future<List<ConsultantPreviewEntity>> getTopConsultants();
}
