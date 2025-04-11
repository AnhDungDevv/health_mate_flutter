import 'package:health_mate/src/home/doamin/entity/recommended_consultant_entity.dart';
import 'package:health_mate/src/home/doamin/repos/recommended_consultant_repository.dart';

class GetRecommendedConsultantsUseCase {
  final IRecommendedConsultantRepository repository;

  GetRecommendedConsultantsUseCase(this.repository);

  Future<List<ConsultantPreviewEntity>> call() {
    return repository.getRecommendedConsultants();
  }
}
