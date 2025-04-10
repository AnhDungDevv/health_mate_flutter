// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expertise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicExpertiseModel _$BasicExpertiseModelFromJson(Map<String, dynamic> json) =>
    BasicExpertiseModel(
      id: json['id'] as String?,
      category: json['category'] as String,
      videoURL: json['videoURL'] as String,
      identityProofFile: _fileFromJson(json['identityProofFile'] as String?),
    );

Map<String, dynamic> _$BasicExpertiseModelToJson(
        BasicExpertiseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'videoURL': instance.videoURL,
      'identityProofFile': _fileToJson(instance.identityProofFile),
    };
