import 'package:health_mate/src/interest_consultant_type/domain/entities/consultant_type_entity.dart';

abstract class InterestConsultantRepository {
  Future<List<ConsultantTypeEntity>> getInterestConsultants();
}
