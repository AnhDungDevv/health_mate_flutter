import 'package:health_mate/src/home/doamin/entity/recommended_consultant_entity.dart';

class RecommendedConsultantWithStatusEntity {
  final ConsultantPreviewEntity consultant;
  final bool isOnline;

  const RecommendedConsultantWithStatusEntity({
    required this.consultant,
    required this.isOnline,
  });

  RecommendedConsultantWithStatusEntity copyWith({
    ConsultantPreviewEntity? consultant,
    bool? isOnline,
  }) {
    return RecommendedConsultantWithStatusEntity(
      consultant: consultant ?? this.consultant,
      isOnline: isOnline ?? this.isOnline,
    );
  }
}
