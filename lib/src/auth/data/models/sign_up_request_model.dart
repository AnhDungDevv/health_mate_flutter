import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/core/serializer/serializers.dart';
import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';

part 'sign_up_request_model.g.dart';

abstract class SignUpRequestModel
    implements Built<SignUpRequestModel, SignUpRequestModelBuilder> {
  String? get name;
  String? get email;
  String? get password;
  String? get phone;
  String? get referralCode;
  String? get avatar;
  Role get role;
  String? get country;
  String? get bio;
  String? get city;

  SignUpRequestModel._();

  factory SignUpRequestModel(
          [void Function(SignUpRequestModelBuilder) updates]) =
      _$SignUpRequestModel;

  factory SignUpRequestModel.fromEntity(SignUpEntity entity) {
    return SignUpRequestModel(
      (b) => b
        ..name = entity.name
        ..email = entity.email
        ..password = entity.password
        ..phone = entity.phone
        ..role = entity.role
        ..referralCode = entity.referralCode
        ..country = entity.country
        ..city = entity.city
        ..avatar = entity.avatar
        ..bio = entity.bio,
    );
  }

  SignUpEntity toEntity() {
    return SignUpEntity(
      name: name,
      email: email,
      password: password,
      phone: phone,
      role: role,
      referralCode: referralCode,
      country: country,
      city: city,
      avatar: avatar,
      bio: bio,
    );
  }

  static SignUpRequestModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SignUpRequestModel.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SignUpRequestModel.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<SignUpRequestModel> get serializer =>
      _$signUpRequestModelSerializer;
}
