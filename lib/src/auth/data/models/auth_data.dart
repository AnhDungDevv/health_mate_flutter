import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';

class AuthDataModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  AuthDataModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  AuthDataEntity toEntity() {
    return AuthDataEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  // 🛠 Chuyển từ JSON -> Model
  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    return AuthDataModel(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      user: UserModel.fromJson(json["user"]),
    );
  }

  // 🛠 Chuyển từ Model -> JSON
  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
      "user": user.toJson(),
    };
  }
}
