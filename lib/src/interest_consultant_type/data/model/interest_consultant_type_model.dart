import '../../domain/entities/consultant_type_entity.dart';

class ConsultantTypeModel extends ConsultantTypeEntity {
  ConsultantTypeModel({
    required super.id,
    required super.name,
    required super.imageURL,
  });

  factory ConsultantTypeModel.fromJson(Map<String, dynamic> json) {
    return ConsultantTypeModel(
      id: json["id"] as int,
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
