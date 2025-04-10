import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/profile/data/model/role.dart';

class SignUpState {
  final SignUpEntity data;
  final bool isLoading;
  final String? errorMessage;

  SignUpState({
    required this.data,
    this.isLoading = false,
    this.errorMessage,
  });

  SignUpState copyWith({
    SignUpEntity? data,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignUpState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  // Initial state
  factory SignUpState.initial() {
    return SignUpState(
      data: const SignUpEntity(role: Role.customer),
    );
  }
}
