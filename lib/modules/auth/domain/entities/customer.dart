class CustomerEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final String phone;
  final String? avatar;

  CustomerEntity({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'avatar': avatar,
    };
  }

  factory CustomerEntity.fromJson(Map<String, dynamic> json) {
    return CustomerEntity(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
