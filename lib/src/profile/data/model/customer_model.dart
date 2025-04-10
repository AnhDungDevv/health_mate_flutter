import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/profile/data/model/role.dart';
import 'package:health_mate/src/profile/domain/entities/customer_entity.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@Freezed(unionKey: 'type')
sealed class CustomerModel with _$CustomerModel {
  const CustomerModel._();

  const factory CustomerModel.base({
    required String id,
    required String name,
    @RoleConverter() required Role role,
    String? email,
    String? phone,
    String? avatar,
    String? referralCode,
  }) = BaseCustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

extension CustomerModelX on CustomerModel {
  CustomerEntity toEntity() => switch (this) {
        BaseCustomerModel c => CustomerEntity(
            id: c.id,
            name: c.name,
            role: c.role,
            email: c.email,
            phone: c.phone,
            avatar: c.avatar,
            referralCode: c.referralCode,
          ),
      };
}
