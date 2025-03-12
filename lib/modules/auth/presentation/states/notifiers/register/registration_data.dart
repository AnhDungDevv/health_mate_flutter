import 'package:health_mate/modules/auth/data/models/user_model.dart';

class RegistrationData {
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

  RegistrationData({
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

  RegistrationData copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    Role? role,
    String? referralCode,
    String? country,
    String? city,
    String? bio,
    String? avatar,
    String? status,
  }) {
    return RegistrationData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      referralCode: referralCode ?? this.referralCode,
      country: country ?? this.country,
      city: city ?? this.city,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
    );
  }
}
