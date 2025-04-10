import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/profile/data/model/role.dart';
import 'package:health_mate/src/profile/domain/entities/consultant_entity.dart';
import 'package:health_mate/src/profile/domain/entities/customer_entity.dart';
import 'package:health_mate/src/profile/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(unionKey: 'role')
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel.customer({
    required String id,
    required String name,
    @RoleConverter() required Role role,
    String? email,
    String? phone,
    String? avatar,
    String? referralCode,
    String? password,
  }) = CustomerModel;

  const factory UserModel.consultant({
    required String id,
    required String name,
    @RoleConverter() required Role role,
    String? email,
    String? phone,
    String? avatar,
    String? referralCode,
    String? password,
    String? bio,
    String? country,
    String? city,
  }) = ConsultantModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => switch (this) {
        CustomerModel c => CustomerEntity(
            id: c.id,
            name: c.name,
            role: c.role,
            email: c.email,
            phone: c.phone,
            avatar: c.avatar,
            referralCode: c.referralCode,
          ),
        ConsultantModel c => ConsultantEntity(
            id: c.id,
            name: c.name,
            role: c.role,
            email: c.email,
            phone: c.phone,
            avatar: c.avatar,
            referralCode: c.referralCode,
            bio: c.bio,
            country: c.country,
            city: c.city,
          ),
      };
}
