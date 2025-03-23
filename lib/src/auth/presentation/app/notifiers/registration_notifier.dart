import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/user/data/models/customer_model.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'package:health_mate/src/auth/presentation/app/states/registration_state.dart';
import 'package:health_mate/src/user/data/models/consultant_model.dart';
import 'package:health_mate/src/auth/domain/usecases/register_usecase.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  final RegisterUsecase _registerUsecase;

  RegistrationNotifier(this._registerUsecase)
      : super(RegistrationState.initial());

  int get totalStep => 3;

  void nextStep() {
    if (!mounted || state.currentStep >= totalStep) return;
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void prevStep() {
    if (!mounted || state.currentStep <= 1) return;
    state = state.copyWith(currentStep: state.currentStep - 1);
  }

  void setRole(Role role) {
    if (!mounted || state.data.role == role) return;
    state = state.copyWith(data: state.data.copyWith(role: role));
  }

  void updateData({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? country,
    String? city,
    String? avatar,
    String? status,
    String? bio,
    Role? role,
    String? referralCode,
  }) {
    if (!mounted) return;
    final newData = state.data.copyWith(
      name: name ?? state.data.name,
      email: email ?? state.data.email,
      password: password ?? state.data.password,
      phone: phone ?? state.data.phone,
      referralCode: referralCode ?? state.data.referralCode,
      country: country ?? state.data.country,
      city: city ?? state.data.city,
      avatar: avatar ?? state.data.avatar,
      bio: bio ?? state.data.bio,
      role: role ?? state.data.role,
    );
    if (newData != state.data) {
      state = state.copyWith(data: newData);
    }
  }

  Future<void> register() async {
    if (!mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final entity = _createUserEntity();
      await _registerUsecase(entity);

      if (mounted) {
        state = RegistrationState.initial();
      }
    } catch (e) {
      if (mounted) {
        state = state.copyWith(isLoading: false, errorMessage: e.toString());
      }
    }
  }

  UserEntity _createUserEntity() {
    final data = state.data;
    return data.role == Role.consultant
        ? ConsultantModel.fromRegistrationData(data).toEntity()
        : CustomerModel.fromRegistrationData(data).toEntity();
  }
}
