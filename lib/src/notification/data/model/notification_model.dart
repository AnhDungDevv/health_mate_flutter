// notification_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/notification_entity.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
sealed class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required String title,
    required String description,
    required String time,
    required DateTime date,
    @JsonKey(
      fromJson: _notificationTypeFromJson,
      toJson: _notificationTypeToJson,
    )
    required NotificationType type,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  factory NotificationModel.fromEntity(NotificationEntity entity) =>
      NotificationModel(
        title: entity.title,
        description: entity.description,
        time: entity.time,
        date: entity.date,
        type: entity.type,
      );
}

// Extension to convert model -> entity
extension NotificationModelX on NotificationModel {
  NotificationEntity toEntity() => NotificationEntity(
        title: title,
        description: description,
        time: time,
        date: date,
        type: type,
      );
}

// Enum helper
NotificationType _notificationTypeFromJson(String value) =>
    NotificationType.values.firstWhere((e) => e.name == value);

String _notificationTypeToJson(NotificationType type) => type.name;
