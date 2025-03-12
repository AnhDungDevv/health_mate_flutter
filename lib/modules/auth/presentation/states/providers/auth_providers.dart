import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/auth/domain/repositories/auth_repository.dart';
import 'package:health_mate/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:health_mate/modules/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/modules/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/modules/auth/domain/usecases/otp_usecase.dart';
import 'package:health_mate/modules/auth/domain/usecases/register_usecase.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/otp/verification_notifier.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/otp/verification_state.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/register/registration_notifier.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/register/registration_state.dart';

// Providers for Auth Sources
final authRemoteSourceProvider = Provider((ref) => AuthRemoteSource());
final authLocalSourceProvider = Provider((ref) => AuthLocalSource());

// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    remoteSource: ref.read(authRemoteSourceProvider),
    localSource: ref.read(authLocalSourceProvider),
  ),
);

// Providers for Use Cases
final registerProvider =
    Provider((ref) => RegisterUsecase(ref.read(authRepositoryProvider)));
final sendOtpUseCaseProvider =
    Provider((ref) => SendOtpUseCase(ref.read(authRepositoryProvider)));
final verifyOtpUseCaseProvider =
    Provider((ref) => VerifyOtpUseCase(ref.read(authRepositoryProvider)));

// Providers for Notifiers
final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationState>(
  (ref) => RegistrationNotifier(ref.read(registerProvider)),
);

final authOtpNotifierProvider =
    StateNotifierProvider<AuthOtpNotifier, AuthOtpState>(
  (ref) => AuthOtpNotifier(
      ref.read(sendOtpUseCaseProvider), ref.read(verifyOtpUseCaseProvider)),
);

// State Providers
final countryCodeProvider = StateProvider<String>((ref) => '+84');
final phoneControllerProvider = Provider((ref) => TextEditingController());
final keyboardProvider = StateProvider<bool>((ref) => false);
