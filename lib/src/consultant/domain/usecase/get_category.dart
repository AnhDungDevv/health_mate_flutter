import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/consultant/domain/repository/category_repo.dart';

import '../entities/category_entity.dart';

class GetInterestConsultantsUseCase {
  final InterestConsultantRepository repository;

  GetInterestConsultantsUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getInterestConsultants();
  }
}
