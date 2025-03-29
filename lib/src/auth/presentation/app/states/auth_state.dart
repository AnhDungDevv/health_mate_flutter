import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState {
  final AuthStatus status;
  final AuthDataEntity? authData;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.authData,
  });

  AuthState copyWith({AuthStatus? status, AuthDataEntity? authData}) {
    return AuthState(
      status: status ?? this.status,
      authData: authData ?? this.authData,
    );
  }
}
