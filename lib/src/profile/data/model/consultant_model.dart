import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/auth/presentation/app/states/sign_up_state.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';
import 'package:health_mate/src/profile/domain/entities/consultant_entity.dart';

part 'consultant_model.g.dart';

abstract class ConsultantModel
    implements Built<ConsultantModel, ConsultantModelBuilder> {
  String get id;
  String get name;
  Role get role;
  String? get email;
  String? get phone;
  String? get avatar;
  String? get referralCode;
  String? get bio;
  String? get country;
  String? get city;

  ConsultantModel._();

  factory ConsultantModel([void Function(ConsultantModelBuilder) updates]) =
      _$ConsultantModel;

  factory ConsultantModel.fromRegistrationData(SignUpEntity data) {
    return ConsultantModel((b) => b
      ..name = data.name ?? ''
      ..email = data.email ?? ''
      ..phone = data.phone ?? ''
      ..role = data.role
      ..country = data.country ?? ''
      ..city = data.city ?? ''
      ..avatar = data.avatar ?? ''
      ..bio = data.bio ?? ''
      ..referralCode = data.referralCode ?? '');
  }

  factory ConsultantModel.fromEntity(ConsultantEntity entity) {
    return ConsultantModel((b) => b
      ..id = entity.id
      ..name = entity.name
      ..role = entity.role
      ..email = entity.email
      ..phone = entity.phone
      ..avatar = entity.avatar
      ..referralCode = entity.referralCode
      ..bio = entity.bio
      ..country = entity.country
      ..city = entity.city);
  }

  ConsultantEntity toEntity() {
    return ConsultantEntity(
      id: id,
      name: name,
      role: role,
      email: email,
      phone: phone,
      avatar: avatar,
      referralCode: referralCode,
      bio: bio,
      country: country,
      city: city,
    );
  }

  static Serializer<ConsultantModel> get serializer =>
      _$consultantModelSerializer;
}
