import 'package:health_mate/modules/auth/domain/entities/customer.dart';

class ConsultantEntity extends CustomerEntity {
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
    required super.role,
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
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'],
      expertise: json['expertise'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      role: json['role'],
    );
  }
}
