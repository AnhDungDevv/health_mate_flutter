import 'package:flutter/material.dart';

enum NotificationType { message, update, payment }

class NotificationEntity {
  final String title;
  final String description;
  final String time;
  final DateTime date;
  final NotificationType type;

  NotificationEntity({
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.type,
  });
}

extension NotificationTypeExtension on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.message:
        return Icons.message;
      case NotificationType.update:
        return Icons.update;
      case NotificationType.payment:
        return Icons.attach_money;
    }
  }
}
