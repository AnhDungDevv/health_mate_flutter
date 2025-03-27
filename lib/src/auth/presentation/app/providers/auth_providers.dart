import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';
import 'package:health_mate/src/auth/data/repos/auth_repo_impl.dart';
import 'package:health_mate/src/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/src/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/src/auth/domain/usecases/sign_in_usecase.dart';
import 'package:health_mate/src/auth/domain/usecases/otp_usecase.dart';
import 'package:health_mate/src/auth/domain/usecases/register_usecase.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/send_o_t_p_notifier.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/sign_up_step_notifier.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/verify_o_t_p_notifier.dart';
import 'package:health_mate/src/auth/presentation/app/states/send_o_t_p_state.dart';
import 'package:health_mate/src/auth/presentation/app/states/verify_o_t_p_state.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/sign_up_notifier.dart';
import 'package:health_mate/src/auth/presentation/app/states/sign_up_state.dart';
import 'package:health_mate/src/auth/presentation/app/states/signin_state.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/signin_notifier.dart';

// Auth Sources
final authRemoteSourceProvider = Provider((ref) => AuthRemoteSource());
final authLocalSourceProvider = Provider((ref) => AuthLocalSource());

// Auth Repository
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    remoteSource: ref.read(authRemoteSourceProvider),
    localSource: ref.read(authLocalSourceProvider),
  ),
);

// Use Cases
final signUpUsecaseProvider =
    Provider((ref) => SignUpUsecase(ref.watch(authRepositoryProvider)));

final loginUseCaseProvider = Provider(
    (ref) => LoginUsecase(repository: ref.watch(authRepositoryProvider)));

final sendOtpUseCaseProvider =
    Provider((ref) => SendOtpUseCase(ref.watch(authRepositoryProvider)));
final verifyOtpUseCaseProvider =
    Provider((ref) => VerifyOtpUseCase(ref.watch(authRepositoryProvider)));

// Notifiers
final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(signUpUsecase: ref.read(signUpUsecaseProvider)),
);

final sendOtpProvider = StateNotifierProvider<SendOTPNotifier, SendOTPState>(
  (ref) => SendOTPNotifier(ref.read(sendOtpUseCaseProvider)),
);

final verifyOtpProvider =
    StateNotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  (ref) => VerifyOtpNotifier(ref.read(verifyOtpUseCaseProvider)),
);

final signInProvider = StateNotifierProvider<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(loginUsecase: ref.watch(loginUseCaseProvider)),
);

final signUpStepProvider = StateNotifierProvider<SignUpStepNotifier, int>(
  (ref) => SignUpStepNotifier(ref: ref),
);

// State Providers
final countryCodeProvider = StateProvider<String>((ref) => '+84');
final phoneControllerProvider = Provider((ref) => TextEditingController());
final keyboardProvider = StateProvider<bool>((ref) => false);
