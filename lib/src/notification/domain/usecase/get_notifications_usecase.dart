import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/notification/domain/entity/notification_entity.dart';
import 'package:health_mate/src/notification/domain/repo/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<Either<Failure, List<NotificationEntity>>> call(String userId) async {
    try {
      final res = await repository.getNotifications(userId);
      return Right(res);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(Failure.fromException(e));
    }
  }
}
