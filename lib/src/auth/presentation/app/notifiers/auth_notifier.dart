import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/src/auth/domain/usecases/auth_usecase.dart';
import 'package:health_mate/src/auth/presentation/app/states/auth_state.dart';

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final AuthUsecase _authUseCase;

  AuthNotifier(this._authUseCase) : super(const AsyncValue.loading()) {
    quickCheckAuth();
  }

  Future<void> quickCheckAuth() async {
    state = const AsyncValue.loading();
    try {
      final accessToken = await _authUseCase.getLocalAccessToken();
      if (accessToken != null) {
        AppLogger.info('check auth 1');
        await _validateAuth();
      } else {
        AppLogger.info(' un check auth 1');
        state = const AsyncValue.data(
            AuthState(status: AuthStatus.unauthenticated));
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> _validateAuth() async {
    try {
      final authData = await _authUseCase.checkAuth();
      if (authData != null) {
        AppLogger.info('check auth 2');
        state = AsyncValue.data(AuthState(
          status: AuthStatus.authenticated,
          authData: authData,
        ));
      } else {
        AppLogger.info('un check auth 2');
        state = const AsyncValue.data(
            AuthState(status: AuthStatus.unauthenticated));
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
