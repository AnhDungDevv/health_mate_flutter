import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/home/doamin/entity/banner_entity.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
sealed class BannerModel with _$BannerModel {
  const factory BannerModel({
    required String title,
    required String subtitle,
    required String image,
    required String icon,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

extension BannerModelMapper on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(
      title: title,
      subtitle: subtitle,
      image: image,
      icon: _mapIconNameToIconData(icon),
    );
  }

  IconData _mapIconNameToIconData(String name) {
    switch (name) {
      case 'local_offer':
        return Icons.local_offer;
      case 'local_shipping':
        return Icons.local_shipping;
      case 'people':
        return Icons.people;
      default:
        return Icons.info;
    }
  }
}
