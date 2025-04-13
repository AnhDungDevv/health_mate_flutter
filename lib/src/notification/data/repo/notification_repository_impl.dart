import 'package:health_mate/core/error/error_handler.dart';
import 'package:health_mate/src/notification/data/model/notification_model.dart';
import 'package:health_mate/src/notification/data/source/notification_remote_source.dart';
import 'package:health_mate/src/notification/domain/entity/notification_entity.dart';
import 'package:health_mate/src/notification/domain/repo/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteSource remoteSource;

  NotificationRepositoryImpl(this.remoteSource);

  @override
  Future<List<NotificationEntity>> getNotifications(String userId) async {
    try {
      final res = await remoteSource.fetchNotifications(userId);
      return res.map((e) => e.toEntity()).toList();
    } catch (e) {
      final failure = ErrorHandler.handleError(e);
      throw failure;
    }
  }
}
