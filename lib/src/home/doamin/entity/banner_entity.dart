// domain/entities/banner_entity.dart
import 'package:flutter/material.dart';

class BannerEntity {
  final String title;
  final String subtitle;
  final IconData icon;
  final String image;

  BannerEntity({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.image,
  });
}
