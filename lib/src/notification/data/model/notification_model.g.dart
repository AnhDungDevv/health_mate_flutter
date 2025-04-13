// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      title: json['title'] as String,
      description: json['description'] as String,
      time: json['time'] as String,
      date: DateTime.parse(json['date'] as String),
      type: _notificationTypeFromJson(json['type'] as String),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'date': instance.date.toIso8601String(),
      'type': _notificationTypeToJson(instance.type),
    };
