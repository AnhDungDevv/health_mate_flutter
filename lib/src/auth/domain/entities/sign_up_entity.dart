import 'package:equatable/equatable.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';

class SignUpEntity extends Equatable {
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
  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        role,
        referralCode,
        country,
        city,
        avatar,
        bio,
      ];
}
