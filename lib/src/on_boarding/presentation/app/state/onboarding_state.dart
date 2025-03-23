import 'package:health_mate/src/on_boarding/domain/entities/onboarding_entity.dart';

class OnboardingState {
  final bool isLoading;
  final OnboardingEntity data;
  final String? error;
  OnboardingState copyWith({
    bool? isLoading,
    OnboardingEntity? data,
    String? error,
  }) {
    return OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  OnboardingState({
    this.isLoading = false,
    required this.data,
    this.error,
  });
}
