// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    _AppointmentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialization: json['specialization'] as String,
      dateTime: json['dateTime'] as String,
      duration: json['duration'] as String,
      imageUrl: json['imageUrl'] as String,
      isVideo: json['isVideo'] as bool,
    );

Map<String, dynamic> _$AppointmentModelToJson(_AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialization': instance.specialization,
      'dateTime': instance.dateTime,
      'duration': instance.duration,
      'imageUrl': instance.imageUrl,
      'isVideo': instance.isVideo,
    };
