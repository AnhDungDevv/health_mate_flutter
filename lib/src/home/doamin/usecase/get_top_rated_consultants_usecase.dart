import 'package:health_mate/src/home/doamin/entity/recommended_consultant_entity.dart';
import 'package:health_mate/src/home/doamin/repos/recommended_consultant_repository.dart';

class GetTopRatedConsultantsUseCase {
  final IRecommendedConsultantRepository repository;

  GetTopRatedConsultantsUseCase(this.repository);

  Future<List<ConsultantPreviewEntity>> call() async {
    return await repository.getRecommendedConsultants();
  }
}
