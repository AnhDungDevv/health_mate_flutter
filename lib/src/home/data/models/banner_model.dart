import 'package:freezed_annotation/freezed_annotation.dart';

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
