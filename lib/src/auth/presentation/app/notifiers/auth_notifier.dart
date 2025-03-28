import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/domain/usecases/check_login_usecase.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final CheckLoginUsecase _checkLoginUsecase;

  AuthNotifier(this._checkLoginUsecase) : super(AuthInitial());

  Future<void> checkLogin() async {
    state = AuthLoading();
    final result = await _checkLoginUsecase();

    result.fold(
      (failure) => state = AuthUnauthenticated(),
      (user) => state = AuthAuthenticated(user),
    );
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}
