import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/core/serializer/serializers.dart';
import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';

part 'auth_data.g.dart';

abstract class AuthDataModel
    implements Built<AuthDataModel, AuthDataModelBuilder> {
  // Token truy cập
  String get accessToken;

  // Token làm mới
  String get refreshToken;

  // Thông tin người dùng
  UserModel get user;

  // Thời gian hết hạn (kiểu int)
  int get expiresIn;

  // Trạng thái (kiểu String, vì backend trả về "success")
  String get status;

  // Thông báo
  String get message;

  AuthDataModel._();

  factory AuthDataModel([void Function(AuthDataModelBuilder) updates]) =
      _$AuthDataModel;

  // Deserialize từ JSON
  static AuthDataModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthDataModel.serializer, json)!;
  }

  // Serialize sang JSON
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthDataModel.serializer, this)
        as Map<String, dynamic>;
  }

  // Chuyển đổi sang Entity
  AuthDataEntity toEntity() {
    return AuthDataEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toEntity(),
      expiresIn: expiresIn,
      status: status,
      message: message,
    );
  }

  static Serializer<AuthDataModel> get serializer => _$authDataModelSerializer;
}
