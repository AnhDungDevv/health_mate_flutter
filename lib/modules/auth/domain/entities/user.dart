class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? avatar;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'],
    );
  }
}
