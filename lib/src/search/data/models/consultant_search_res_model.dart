import 'package:health_mate/src/search/domain/entities/consultant_search_res.dart';

class ConsultantSearchResModel {
  final int id;
  final String name;

  ConsultantSearchResModel({required this.id, required this.name});

  factory ConsultantSearchResModel.fromJson(Map<String, dynamic> json) {
    return ConsultantSearchResModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  ConsultantSearchRes toEntity() {
    return ConsultantSearchRes(id: id, name: name);
  }
}
