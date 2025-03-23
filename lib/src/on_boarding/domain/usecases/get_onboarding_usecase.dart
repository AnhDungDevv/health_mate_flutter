import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/on_boarding/domain/entities/onboarding_entity.dart';
import 'package:health_mate/src/on_boarding/domain/repos/onboarding_repo.dart';

class GetOnboardingUsecase {
  final OnboardingRepo repo;
  GetOnboardingUsecase(this.repo);
  Future<Either<Failure, OnboardingEntity>> call() async {
    return await repo.getOnboardingData();
  }
}
