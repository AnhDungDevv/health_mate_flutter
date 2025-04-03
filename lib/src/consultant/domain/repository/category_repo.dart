import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/consultant/domain/entities/category_entity.dart';

abstract class InterestConsultantRepository {
  Future<Either<Failure, List<CategoryEntity>>> getInterestConsultants();
  Future<void> postSelectedInterests(String userId, List<String> interests);
}
