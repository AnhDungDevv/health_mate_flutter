import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/auth/domain/usecases/login_use_case.dart';
import 'package:health_mate/modules/auth/presentation/provider/auth_form_state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  AuthNotifier(this._loginUseCase) : super(const AuthState());
  Future<void> login(String email, String password) async {
    await _loginUseCase(email, password);
  }

  Future<void> signUp(String email, String password) async {
    await _loginUseCase(email, password);
  }
}
