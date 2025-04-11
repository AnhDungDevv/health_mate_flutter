import 'package:health_mate/src/home/data/models/recommended_consultant_model.dart';
import 'package:health_mate/src/home/doamin/entity/recommended_consultant_entity.dart';

extension RecommendedConsultantMapper on ConsultantPreviewModel {
  ConsultantPreviewEntity toEntity() {
    return ConsultantPreviewEntity(
      id: id,
      name: name,
      image: image,
      specialty: specialty,
      rating: rating,
    );
  }
}
