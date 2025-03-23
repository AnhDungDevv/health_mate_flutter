import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';
import 'package:health_mate/src/auth/domain/usecases/login_usecase.dart';

class SigninNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  final LoginUsecase loginUsecase;

  SigninNotifier({required this.loginUsecase}) : super(const AsyncData(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    final user = UserEntity(email: email, password: password);

    final result = await loginUsecase(user);

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (user) => AsyncData(user),
    );
  }
}
