import 'package:health_mate/modules/auth/presentation/states/notifiers/register/registration_data.dart';

class RegistrationState {
  final int currentStep;
  final RegistrationData data;
  final bool isLoading;
  final String? errorMessage;

  RegistrationState({
    required this.currentStep,
    required this.data,
    this.isLoading = false,
    this.errorMessage,
  });

  RegistrationState copyWith({
    int? currentStep,
    RegistrationData? data,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RegistrationState(
      currentStep: currentStep ?? this.currentStep,
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
