import 'package:json_annotation/json_annotation.dart';

enum Role { customer, consultant }

class RoleConverter implements JsonConverter<Role, String> {
  const RoleConverter();

  @override
  Role fromJson(String json) {
    return Role.values.firstWhere((e) => e.name == json);
  }

  @override
  String toJson(Role role) {
    return role.name;
  }
}
