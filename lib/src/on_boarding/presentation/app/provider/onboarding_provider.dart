import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:health_mate/src/on_boarding/data/source/onboarding_local_source.dart';
import 'package:health_mate/src/on_boarding/data/source/onboarding_remote_source.dart';
import 'package:health_mate/src/on_boarding/domain/repos/onboarding_repo.dart';
import 'package:health_mate/src/on_boarding/domain/usecases/get_onboarding_usecase.dart';

final onboardingRemoteSourceProvider =
    Provider<OnboardingRemoteSource>((ref) => OnboardingRemoteSourceImpl());

final onboardingLocalSource =
    Provider<OnboardingLocalSource>((ref) => OnboardingLocalSourceImpl());

final onboardingRepoProvider = Provider<OnboardingRepo>((ref) =>
    OnBoardingRepoImpl(
        remoteSource: ref.watch(onboardingRemoteSourceProvider),
        localSource: ref.watch(onboardingLocalSource)));

final getOnboardingUseCaseProvider = Provider<GetOnboardingUsecase>(
    (ref) => GetOnboardingUsecase(ref.watch(onboardingRepoProvider)));
