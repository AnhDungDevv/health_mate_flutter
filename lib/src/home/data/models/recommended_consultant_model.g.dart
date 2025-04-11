// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_consultant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultantPreviewModel _$ConsultantPreviewModelFromJson(
        Map<String, dynamic> json) =>
    _ConsultantPreviewModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      specialty: json['specialty'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ConsultantPreviewModelToJson(
        _ConsultantPreviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'specialty': instance.specialty,
      'rating': instance.rating,
    };
