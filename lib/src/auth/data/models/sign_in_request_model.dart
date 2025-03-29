import 'package:health_mate/src/auth/domain/entities/sign_in_entity.dart';

class SignInRequestModel {
  String email;
  String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  factory SignInRequestModel.fromEntity(SignInEntity entity) {
    return SignInRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }
  SignInEntity toEntity() {
    return SignInEntity(
      email: email,
      password: password,
    );
  }

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) {
    return SignInRequestModel(
      email: json["email"],
      password: json["password"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
