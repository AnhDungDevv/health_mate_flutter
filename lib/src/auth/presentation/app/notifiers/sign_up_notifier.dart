import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/profile/data/model/customer_model.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';
import 'package:health_mate/src/auth/presentation/app/states/sign_up_state.dart';
import 'package:health_mate/src/profile/data/model/consultant_model.dart';
import 'package:health_mate/src/auth/domain/usecases/register_usecase.dart';
import 'package:health_mate/src/profile/domain/entities/user_entity.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpUsecase signUpUsecase;

  SignUpNotifier({required this.signUpUsecase}) : super(SignUpState.initial());

  void setRole(Role role) {
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

  void resetData() {
    state = SignUpState.initial();
  }

  Future<void> register() async {
    if (!mounted) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final entity = _createUserEntity();
      await signUpUsecase(entity);

      if (mounted) {
        state = SignUpState.initial();
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
