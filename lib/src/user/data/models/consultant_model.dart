import 'package:health_mate/src/auth/presentation/app/states/registration_state.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'package:health_mate/src/user/domain/entities/consultant_entity.dart';

class ConsultantModel extends UserModel {
  final String? bio;
  final String? country;
  final String? city;

  ConsultantModel({
    super.id,
    required super.name,
    required super.role,
    super.email,
    super.phone,
    super.avatar,
    super.referralCode,
    this.bio,
    this.country,
    this.city,
  });

  factory ConsultantModel.fromEntity(ConsultantEntity entity) {
    return ConsultantModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      email: entity.email,
      phone: entity.phone,
      avatar: entity.avatar,
      referralCode: entity.referralCode,
      bio: entity.bio,
      country: entity.country,
      city: entity.city,
    );
  }

  /// Chuyển từ RegistrationData sang ConsultantModel
  factory ConsultantModel.fromRegistrationData(RegistrationData data) {
    return ConsultantModel(
      name: data.name ?? '',
      email: data.email ?? '',
      phone: data.phone ?? '',
      role: data.role,
      country: data.country ?? '',
      city: data.city ?? '',
      avatar: data.avatar ?? '',
      bio: data.bio ?? '',
      referralCode: data.referralCode ?? '',
    );
  }

  @override
  ConsultantEntity toEntity() {
    return ConsultantEntity(
      id: id,
      name: name,
      role: role,
      email: email,
      phone: phone,
      avatar: avatar,
      referralCode: referralCode,
      bio: bio,
      country: country,
      city: city,
    );
  }

  factory ConsultantModel.fromJson(Map<String, dynamic> json) {
    return ConsultantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      role: Role.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => Role.consultant,
      ),
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      bio: json['bio'],
      country: json['country'],
      city: json['city'],
      referralCode: json['referralCode'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'bio': bio,
      'country': country,
      'city': city,
    };
  }
}
