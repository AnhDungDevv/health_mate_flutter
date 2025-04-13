import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/notification/domain/entity/notification_entity.dart';

class NotificationState {
  final List<NotificationEntity> notifications;
  final bool isLoading;
  final Failure? failure;

  NotificationState({
    this.notifications = const [],
    this.isLoading = false,
    this.failure,
  });

  NotificationState copyWith({
    List<NotificationEntity>? notifications,
    bool? isLoading,
    Failure? failure,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
    );
  }
}
