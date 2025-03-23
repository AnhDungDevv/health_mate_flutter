import 'package:health_mate/src/interest_consultant_type/domain/repository/interest_consultant_repository.dart';

import '../entities/consultant_type_entity.dart';

class GetInterestConsultants {
  final InterestConsultantRepository repository;

  GetInterestConsultants(this.repository);

  Future<List<ConsultantTypeEntity>> call() async {
    return await repository.getInterestConsultants();
  }
}
