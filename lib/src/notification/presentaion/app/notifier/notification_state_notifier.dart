import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/notification/domain/usecase/get_notifications_usecase.dart';
import 'package:health_mate/src/notification/presentaion/app/state/notification_state.dart';

class NotificationStateNotifier extends StateNotifier<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;

  NotificationStateNotifier(this._getNotificationsUseCase)
      : super(NotificationState());

  Future<void> fetchNotifications(String userId) async {
    state = state.copyWith(isLoading: true);

    final result = await _getNotificationsUseCase(userId);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          failure: failure,
        );
      },
      (notifications) {
        state = state.copyWith(
          isLoading: false,
          notifications: notifications,
        );
      },
    );
  }
}
