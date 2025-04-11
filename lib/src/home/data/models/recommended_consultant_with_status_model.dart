import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/home/data/models/recommended_consultant_model.dart';

part 'recommended_consultant_with_status_model.freezed.dart';
part 'recommended_consultant_with_status_model.g.dart';

@freezed
sealed class RecommendedConsultantWithStatus
    with _$RecommendedConsultantWithStatus {
  const factory RecommendedConsultantWithStatus({
    required ConsultantPreviewModel consultant,
    required bool isOnline,
  }) = _RecommendedConsultantWithStatus;

  factory RecommendedConsultantWithStatus.fromJson(Map<String, dynamic> json) =>
      _$RecommendedConsultantWithStatusFromJson(json);
}
