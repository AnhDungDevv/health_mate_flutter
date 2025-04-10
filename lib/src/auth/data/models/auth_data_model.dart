import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';
import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';

part 'auth_data_model.freezed.dart';
part 'auth_data_model.g.dart';

sealed class AuthResponse {}

@freezed
sealed class AuthDataModel with _$AuthDataModel {
  const AuthDataModel._();

  @Implements<AuthResponse>()
  const factory AuthDataModel.success({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
    required int expiresIn,
    required String status,
    required String message,
  }) = AuthDataModelSuccess;

  @Implements<AuthResponse>()
  const factory AuthDataModel.error({
    required String status,
    required String message,
  }) = AuthDataModelError;

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);
}

extension AuthDataModelX on AuthDataModel {
  AuthDataEntity? toEntity() => switch (this) {
        AuthDataModelSuccess s => AuthDataEntity(
            accessToken: s.accessToken,
            refreshToken: s.refreshToken,
            user: s.user.toEntity(),
            expiresIn: s.expiresIn,
            status: s.status,
            message: s.message,
          ),
        AuthDataModelError _ => null,
      };
}
