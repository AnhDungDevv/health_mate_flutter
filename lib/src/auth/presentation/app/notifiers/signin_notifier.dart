import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/states/signin_state.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';
import 'package:health_mate/src/auth/domain/usecases/login_usecase.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final LoginUsecase loginUsecase;

  SignInNotifier({required this.loginUsecase}) : super(SignInState());

  void updateEmail(String email) {
    if (state.email != email) {
      state = state.copyWith(email: email);
    }
  }

  void updatePassword(String password) {
    if (state.password != password) {
      state = state.copyWith(password: password);
    }
  }

  void reset() {
    state = SignInState();
  }

  Future<void> signIn() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      state = state.copyWith(
          status: SignInStatus.failure,
          errorMessage: "Email và mật khẩu không được để trống!");
      return;
    }

    state = state.copyWith(status: SignInStatus.loading);

    final result = await loginUsecase(
        UserEntity(email: state.email, password: state.password));

    result.fold(
      (failure) => state = state.copyWith(
          status: SignInStatus.failure, errorMessage: failure.message),
      (user) => state = state.copyWith(status: SignInStatus.success),
    );
  }
}
