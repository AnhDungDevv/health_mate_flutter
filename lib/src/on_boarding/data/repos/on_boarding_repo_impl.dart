import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/on_boarding/data/source/onboarding_local_source.dart';
import 'package:health_mate/src/on_boarding/data/source/onboarding_remote_source.dart';
import 'package:health_mate/src/on_boarding/domain/entities/onboarding_entity.dart';
import 'package:health_mate/src/on_boarding/domain/repos/onboarding_repo.dart';

class OnBoardingRepoImpl implements OnboardingRepo {
  final OnboardingRemoteSource remoteSource;
  final OnboardingLocalSource localSource;

  OnBoardingRepoImpl({required this.remoteSource, required this.localSource});

  @override
  Future<Either<Failure, OnboardingEntity>> getOnboardingData() async {
    try {
      final cachedData = await localSource.getCachedOnboardingData();
      if (cachedData != null) {
        return Right(cachedData.toEntity());
      }

      final onboardingData = await remoteSource.fetchOnboardingData();
      await localSource.cacheOnboardingData(onboardingData);
      return Right(onboardingData.toEntity());
    } catch (error) {
      return Left(Failure.fromException(error));
    }
  }
}
