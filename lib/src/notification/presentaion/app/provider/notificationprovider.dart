import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/notification/data/repo/notification_repository_impl.dart';
import 'package:health_mate/src/notification/data/source/notification_remote_source.dart';
import 'package:health_mate/src/notification/domain/repo/notification_repository.dart';
import 'package:health_mate/src/notification/domain/usecase/get_notifications_usecase.dart';
import 'package:health_mate/src/notification/presentaion/app/notifier/notification_state_notifier.dart';
import 'package:health_mate/src/notification/presentaion/app/state/notification_state.dart';

final notificationRemoteSourceProvider = Provider<NotificationRemoteSource>(
  (ref) => NotificationRemoteSourceImpl(),
);

final notificationRepositoryProvider = Provider<NotificationRepository>(
  (ref) =>
      NotificationRepositoryImpl(ref.read(notificationRemoteSourceProvider)),
);

final getNotificationsUseCaseProvider = Provider<GetNotificationsUseCase>(
  (ref) => GetNotificationsUseCase(ref.read(notificationRepositoryProvider)),
);

final notificationStateProvider =
    StateNotifierProvider<NotificationStateNotifier, NotificationState>(
  (ref) => NotificationStateNotifier(ref.read(getNotificationsUseCaseProvider)),
);
