import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/signin_state.dart';

class SignInStateNotifier extends StateNotifier<SigninState> {
  SignInStateNotifier() : super(const SigninState());

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }
}
