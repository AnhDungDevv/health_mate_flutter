import 'package:health_mate/modules/auth/domain/entities/user.dart';

class ConsultantEntity extends UserEntity {
  String expertise;
  int yearsOfExperience;

  ConsultantEntity({
    required super.name,
    required super.email,
    required super.phone,
    super.avatar,
    required this.expertise,
    required this.yearsOfExperience,
    required super.id,
  });

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['expertise'] = expertise;
    data['yearsOfExperience'] = yearsOfExperience;
    return data;
  }

  factory ConsultantEntity.fromJson(Map<String, dynamic> json) {
    return ConsultantEntity(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'],
      expertise: json['expertise'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      id: '',
    );
  }
}
