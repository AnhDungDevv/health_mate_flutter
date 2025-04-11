// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_consultant_with_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendedConsultantWithStatus _$RecommendedConsultantWithStatusFromJson(
        Map<String, dynamic> json) =>
    _RecommendedConsultantWithStatus(
      consultant: ConsultantPreviewModel.fromJson(
          json['consultant'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$RecommendedConsultantWithStatusToJson(
        _RecommendedConsultantWithStatus instance) =>
    <String, dynamic>{
      'consultant': instance.consultant,
      'isOnline': instance.isOnline,
    };
