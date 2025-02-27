class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'avatar': avatar,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('name') ||
        !json.containsKey('id') ||
        !json.containsKey('email') ||
        !json.containsKey('password') ||
        !json.containsKey('phone')) {
      throw ArgumentError('Missing required fields');
    }

    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'],
    );
  }

  get role => null;
}

class ConsultantModel extends UserModel {
  String expertise;
  int yearsOfExperience;

  ConsultantModel({
    required super.name,
    required super.email,
    required super.password,
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

  factory ConsultantModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('expertise') ||
        !json.containsKey('yearsOfExperience')) {
      throw ArgumentError('Missing required fields for Consultant');
    }

    return ConsultantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'],
      expertise: json['expertise'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
    );
  }
}
