import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/domain/usecases/auth_usecase.dart';
import 'package:health_mate/src/auth/presentation/app/states/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUsecase _authUseCase;

  AuthNotifier(this._authUseCase) : super(AuthState());

  Future<void> quickCheckAuth() async {
    final accessToken = await _authUseCase.getLocalAccessToken();

    if (accessToken != null) {
      await _validateAuth();
    } else {
      state =
          state.copyWith(status: AuthStatus.unauthenticated, authData: null);
    }
  }

  Future<void> _validateAuth() async {
    final authData = await _authUseCase.checkAuth();

    if (authData != null) {
      state = state.copyWith(
        status: AuthStatus.authenticated,
        authData: authData,
      );
    } else {
      if (state.status != AuthStatus.unauthenticated) {
        state = const AuthState(status: AuthStatus.unauthenticated);
      }
    }
  }
}
