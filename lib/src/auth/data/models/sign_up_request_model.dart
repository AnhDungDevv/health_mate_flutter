import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/profile/data/model/role.dart';

part 'sign_up_request_model.freezed.dart';
part 'sign_up_request_model.g.dart';

@freezed
sealed class SignUpRequestModel with _$SignUpRequestModel {
  const factory SignUpRequestModel.data({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? referralCode,
    String? avatar,
    @RoleConverter() required Role role,
    String? country,
    String? bio,
    String? city,
  }) = SignUpRequestModelData;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
}

extension SignUpRequestModelX on SignUpRequestModel {
  SignUpEntity? toEntity() {
    return switch (this) {
      SignUpRequestModelData s => SignUpEntity(
          name: s.name,
          email: s.email,
          password: s.password,
          phone: s.phone,
          role: s.role,
          referralCode: s.referralCode,
          country: s.country,
          city: s.city,
          avatar: s.avatar,
          bio: s.bio,
        ),
    };
  }
}
