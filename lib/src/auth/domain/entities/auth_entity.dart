import 'package:equatable/equatable.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';

class AuthDataEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserEntity user;

  const AuthDataEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
  @override
  List<Object?> get props => [accessToken, refreshToken, user];
}
