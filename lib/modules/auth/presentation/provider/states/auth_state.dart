import 'package:health_mate/modules/auth/domain/entities/user.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const AuthState(
      {this.status = AuthStatus.initial, this.user, this.errorMessage});

  AuthState copyWith({
    AuthStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AuthState(
        status: status ?? this.status,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
