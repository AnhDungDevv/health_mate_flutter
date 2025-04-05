import 'package:health_mate/src/profile/domain/entities/user_entity.dart';

class AuthDataEntity {
  final String accessToken;
  final String refreshToken;
  final UserEntity user;
  final int? expiresIn;
  final String? status;
  final String? message;

  const AuthDataEntity(
      {required this.accessToken,
      required this.refreshToken,
      required this.user,
      this.expiresIn,
      this.status,
      this.message});
}
