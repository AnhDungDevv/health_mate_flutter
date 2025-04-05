import 'package:health_mate/src/profile/data/model/user_model.dart';

class SignUpEntity {
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
  const SignUpEntity({
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
  SignUpEntity copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? referralCode,
    String? avatar,
    Role? role,
    String? country,
    String? city,
    String? bio,
  }) {
    return SignUpEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      referralCode: referralCode ?? this.referralCode,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      country: country ?? this.country,
      city: city ?? this.city,
      bio: bio ?? this.bio,
    );
  }
}
