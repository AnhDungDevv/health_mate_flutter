import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

class SignUpRequestModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? referralCode;
  final String? avatar;
  final Role role;
  final String? country;
  final String? bio;
  final String? city;
  SignUpRequestModel({
    this.avatar,
    this.name,
    this.email,
    this.password,
    this.referralCode,
    this.phone,
    required this.role,
    this.country,
    this.city,
    this.bio,
  });

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

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      phone: json["phone"],
      role: Role.values.firstWhere((e) => e.name == json["role"]),
      referralCode: json["referralCode"],
      country: json["country"],
      city: json["city"],
      avatar: json["avatar"],
      bio: json["bio"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "role": role.name,
      "referralCode": referralCode,
      "country": country,
      "city": city,
      "avatar": avatar,
      "bio": bio,
    };
  }
}
