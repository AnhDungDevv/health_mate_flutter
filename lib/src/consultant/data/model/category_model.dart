import '../../domain/entities/category_entity.dart';

class CategoryResModel {
  final String status;
  final String message;
  final CategoryModel data;
  CategoryResModel(
      {required this.status, required this.data, required this.message});
  factory CategoryResModel.fromJson(Map<String, dynamic> json) {
    return CategoryResModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: CategoryModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

extension on CategoryResModel {
  CategoryResEntity toEntity() {
    return CategoryResEntity(
      status: status,
      message: message,
      data: data.toEntity(),
    );
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.imageURL,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] as String,
      name: json["name"] as String,
      imageURL: json["imageURL"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "imageURL": imageURL,
    };
  }
}

extension on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      imageURL: imageURL,
    );
  }
}
