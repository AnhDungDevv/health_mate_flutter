import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/core/serializer/serializers.dart';
import 'package:health_mate/src/profile/domain/entities/user_entity.dart';

part 'user_model.g.dart';

/// Enum cho Role
enum Role { consultant, customer }

/// Serializer cho Role
class RoleSerializer implements PrimitiveSerializer<Role> {
  @override
  final Iterable<Type> types = const [Role];
  @override
  final String wireName = 'Role';

  @override
  Object serialize(Serializers serializers, Role role,
      {FullType specifiedType = FullType.unspecified}) {
    return role.name; // Serialize enum thành string
  }

  @override
  Role deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return Role.values.firstWhere(
        (e) => e.name == serialized); // Deserialize string thành enum
  }
}

/// UserModel dùng Built Value
abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  String get id;
  String get name;
  Role get role;
  String? get email;
  String? get phone;
  String? get avatar;
  String? get referralCode;
  String? get password;

  // Contructor mặc định (private)
  UserModel._();

  factory UserModel([void Function(UserModelBuilder) updates]) = _$UserModel;

  // Chuyển từ JSON -> Model
  static UserModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserModel.serializer, json)!;
  }

  // Chuyển từ Model -> JSON
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserModel.serializer, this)
        as Map<String, dynamic>;
  }

  // Chuyển từ Entity -> UserModel
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      (b) => b
        ..id = entity.id
        ..name = entity.name
        ..role = entity.role
        ..email = entity.email
        ..phone = entity.phone
        ..avatar = entity.avatar
        ..referralCode = entity.referralCode
        ..password = entity.password,
    );
  }

  // Chuyển từ UserModel -> Entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      role: role,
      email: email,
      phone: phone,
      avatar: avatar,
      referralCode: referralCode,
      password: password,
    );
  }

  // Serializer
  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
