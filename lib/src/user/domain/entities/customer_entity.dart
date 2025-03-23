import 'package:health_mate/src/user/domain/entities/user_entity.dart';

class CustomerEntity extends UserEntity {
  const CustomerEntity({
    required super.id,
    required super.name,
    required super.role,
    super.email,
    super.phone,
    super.avatar,
    super.referralCode,
  });
}
