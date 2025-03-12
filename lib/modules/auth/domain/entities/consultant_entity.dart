import 'package:health_mate/modules/auth/domain/entities/user_entity.dart';

class ConsultantEntity extends UserEntity {
  final String? bio;
  final String? country;
  final String? city;

  const ConsultantEntity({
    required super.id,
    required super.name,
    required super.role,
    super.email,
    super.phone,
    super.avatar,
    super.referralCode,
    this.bio,
    this.country,
    this.city,
  });
}
