import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/on_boarding/domain/entities/onboarding_entity.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, OnboardingEntity>> getOnboardingData();
}
