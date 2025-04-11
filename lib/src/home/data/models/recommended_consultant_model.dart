import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommended_consultant_model.freezed.dart';
part 'recommended_consultant_model.g.dart';

@freezed
sealed class ConsultantPreviewModel with _$ConsultantPreviewModel {
  const factory ConsultantPreviewModel({
    required String id,
    required String name,
    required String image,
    required String specialty,
    required double rating,
  }) = _ConsultantPreviewModel;

  factory ConsultantPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultantPreviewModelFromJson(json);
}
