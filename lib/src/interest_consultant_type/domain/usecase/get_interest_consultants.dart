import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/interest_consultant_type/domain/repository/interest_consultant_repository.dart';

import '../entities/consultant_type_entity.dart';

class GetInterestConsultantsUseCase {
  final InterestConsultantRepository repository;

  GetInterestConsultantsUseCase(this.repository);

  Future<Either<Failure, List<ConsultantTypeEntity>>> call() async {
    return await repository.getInterestConsultants();
  }
}
