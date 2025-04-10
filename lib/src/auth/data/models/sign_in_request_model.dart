import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/auth/domain/entities/sign_in_entity.dart';

part 'sign_in_request_model.freezed.dart';
part 'sign_in_request_model.g.dart';

@freezed
sealed class SignInRequestModel with _$SignInRequestModel {
  const factory SignInRequestModel.data({
    required String email,
    required String password,
  }) = SignInRequestModelData;

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);
}

extension SignInRequestModelX on SignInRequestModel {
  SignInEntity? toEntity() {
    return switch (this) {
      SignInRequestModelData s => SignInEntity(
          email: s.email,
          password: s.password,
        ),
    };
  }
}
