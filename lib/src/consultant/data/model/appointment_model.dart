import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/appointment_entity.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
sealed class AppointmentModel with _$AppointmentModel {
  const factory AppointmentModel({
    required String id,
    required String name,
    required String specialization,
    required String dateTime,
    required String duration,
    required String imageUrl,
    required bool isVideo,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
}

extension AppointmentModelMapper on AppointmentModel {
  AppointmentEntity toEntity() {
    return AppointmentEntity(
      id: id,
      name: name,
      specialization: specialization,
      dateTime: dateTime,
      duration: duration,
      imageUrl: imageUrl,
      isVideo: isVideo,
    );
  }
}
