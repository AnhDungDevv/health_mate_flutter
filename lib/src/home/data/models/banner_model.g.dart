// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      image: json['image'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image': instance.image,
      'icon': instance.icon,
    };
