import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/on_boarding/domain/entities/onboarding_entity.dart';
import 'package:health_mate/src/on_boarding/domain/usecases/get_onboarding_usecase.dart';
import 'package:health_mate/src/on_boarding/presentation/app/provider/onboarding_provider.dart';
import 'package:health_mate/src/on_boarding/presentation/app/state/onboarding_state.dart';

const OnboardingEntity defaultOnboardingData = OnboardingEntity(
  id: "1",
  image: "assets/images/onboarding.png",
  contents: [
    OnboardingContentEntity(
      id: "1.1",
      title: "Discover Your Ideal Consultant!",
      description:
          "Diverse range of categories and connect with experienced consultants",
    ),
    OnboardingContentEntity(
      id: "2.1",
      title: "Instant Bookings, Hassle-Free",
      description:
          "You can easily book video or audio calls with your chosen consultant.",
    ),
    OnboardingContentEntity(
      id: "3.1",
      title: "Secure Payments for Peace of Mind",
      description:
          "Make payments with confidence, knowing that your information is well-protected!",
    ),
  ],
);

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final GetOnboardingUsecase getOnboardingUseCase;
  OnboardingNotifier(this.getOnboardingUseCase)
      : super(OnboardingState(data: defaultOnboardingData));

  Future<void> loadOnboardingData() async {
    final startTime = DateTime.now();
    state = state.copyWith(isLoading: true);

    final result = await getOnboardingUseCase();

    final endTime = DateTime.now();
    print(
        "API Call Duration: ${endTime.difference(startTime).inMilliseconds} ms");

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          data: defaultOnboardingData,
        );
      },
      (data) {
        state = state.copyWith(
          isLoading: false,
          data: data,
        );
      },
    );
  }
}

final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
        (ref) => OnboardingNotifier(ref.watch(getOnboardingUseCaseProvider)));
