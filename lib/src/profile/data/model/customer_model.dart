import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';
import 'package:health_mate/src/profile/domain/entities/customer_entity.dart';

part 'customer_model.g.dart';

abstract class CustomerModel
    implements Built<CustomerModel, CustomerModelBuilder> {
  String get id;
  String get name;
  Role get role;
  String? get email;
  String? get phone;
  String? get avatar;
  String? get referralCode;

  CustomerModel._();

  factory CustomerModel([void Function(CustomerModelBuilder) updates]) =
      _$CustomerModel;

  factory CustomerModel.fromRegistrationData(SignUpEntity data) {
    return CustomerModel((b) => b
      ..name = data.name ?? ''
      ..email = data.email ?? ''
      ..role = data.role
      ..phone = data.phone ?? ''
      ..avatar = data.avatar ?? ''
      ..referralCode = data.referralCode ?? '');
  }

  factory CustomerModel.fromEntity(CustomerEntity entity) {
    return CustomerModel((b) => b
      ..id = entity.id
      ..name = entity.name
      ..role = entity.role
      ..email = entity.email
      ..phone = entity.phone
      ..avatar = entity.avatar
      ..referralCode = entity.referralCode);
  }

  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      role: role,
      email: email,
      phone: phone,
      avatar: avatar,
      referralCode: referralCode,
    );
  }

  static Serializer<CustomerModel> get serializer => _$customerModelSerializer;
}
