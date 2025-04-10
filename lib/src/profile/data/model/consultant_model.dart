import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/profile/data/model/role.dart';
import 'package:health_mate/src/profile/domain/entities/consultant_entity.dart';

part 'consultant_model.freezed.dart';
part 'consultant_model.g.dart';

@Freezed(unionKey: 'type')
sealed class ConsultantModel with _$ConsultantModel {
  const ConsultantModel._();

  const factory ConsultantModel.base({
    required String id,
    required String name,
    @RoleConverter() required Role role,
    String? email,
    String? phone,
    String? avatar,
    String? referralCode,
    String? bio,
    String? country,
    String? city,
  }) = BaseConsultantModel;

  factory ConsultantModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultantModelFromJson(json);
}

extension ConsultantModelX on ConsultantModel {
  ConsultantEntity toEntity() => switch (this) {
        BaseConsultantModel c => ConsultantEntity(
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
