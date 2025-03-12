import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/auth/data/models/customer_model.dart';
import 'package:health_mate/modules/auth/data/models/user_model.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/register/registration_state.dart';
import 'package:health_mate/modules/auth/data/models/consultant_model.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/register/registration_data.dart';
import 'package:health_mate/modules/auth/domain/usecases/register_usecase.dart';

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  final RegisterUsecase _registerUsecase;

  RegistrationNotifier(this._registerUsecase)
      : super(RegistrationState(
          currentStep: 1,
          data: RegistrationData(role: Role.customer),
        ));

  int get totalStep => 3;

  void nextStep() {
    if (!mounted) return;
    if (state.currentStep < totalStep) {
      state = state.copyWith(
        currentStep: state.currentStep + 1,
        errorMessage: null,
      );
    }
  }

  void prevStep() {
    if (!mounted) return;
    if (state.currentStep > 1) {
      state = state.copyWith(
        currentStep: state.currentStep - 1,
        errorMessage: null,
      );
    }
  }

  void setRole(Role role) {
    if (!mounted) return;
    if (state.data.role != role) {
      state = state.copyWith(
        data: state.data.copyWith(
          role: role,
        ),
      );
    }
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
    state = state.copyWith(data: newData);
  }

  Future<void> register() async {
    try {
      if (!mounted) return;
      state = state.copyWith(isLoading: true, errorMessage: null);

      final userModel = state.data.role == Role.consultant
          ? ConsultantModel(
              id: '',
              name: state.data.name ?? '',
              role: state.data.role,
              email: state.data.email,
              phone: state.data.phone,
              avatar: state.data.avatar,
              country: state.data.country,
              city: state.data.city,
              bio: state.data.bio,
            )
          : CustomerModel(
              id: '',
              name: state.data.name ?? '',
              role: state.data.role,
              email: state.data.email,
              phone: state.data.phone,
              avatar: state.data.avatar,
              referralCode: state.data.referralCode,
            );

      await _registerUsecase(userModel.toEntity());

      if (!mounted) return;
      state = RegistrationState(
        currentStep: 1,
        data: RegistrationData(role: Role.customer),
      );
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
