import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/interest_consultant_type/domain/entities/consultant_type_entity.dart';

abstract class InterestConsultantRepository {
  Future<Either<Failure, List<ConsultantTypeEntity>>> getInterestConsultants();
  Future<void> postSelectedInterests(String userId, List<String> interests);
}
