import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/core/serializer/serializers.dart';
import 'package:health_mate/src/auth/domain/entities/sign_in_entity.dart';

part 'sign_in_request_model.g.dart';

abstract class SignInRequestModel
    implements Built<SignInRequestModel, SignInRequestModelBuilder> {
  String get email;
  String get password;

  SignInRequestModel._();

  factory SignInRequestModel(
          [void Function(SignInRequestModelBuilder) updates]) =
      _$SignInRequestModel;

  factory SignInRequestModel.fromEntity(SignInEntity entity) {
    return SignInRequestModel((b) => b
      ..email = entity.email
      ..password = entity.password);
  }

  SignInEntity toEntity() {
    return SignInEntity(
      email: email,
      password: password,
    );
  }

  static SignInRequestModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SignInRequestModel.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SignInRequestModel.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<SignInRequestModel> get serializer =>
      _$signInRequestModelSerializer;
}
