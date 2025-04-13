import 'package:health_mate/src/notification/domain/entity/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getNotifications(String userId);
}
