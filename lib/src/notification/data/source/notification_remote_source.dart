// import 'package:dio/dio.dart';
// import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/notification/domain/entity/notification_entity.dart';

import '../model/notification_model.dart';

abstract class NotificationRemoteSource {
  Future<List<NotificationModel>> fetchNotifications(String userid);
}

class NotificationRemoteSourceImpl implements NotificationRemoteSource {
  // final _dio = ApiClient().dio;
  @override
  Future<List<NotificationModel>> fetchNotifications(String userId) async {
    // try {
    //   final res = await _dio.get('notification/$userId');

    //   final data = res.data as List<dynamic>;
    //   return data.map((json) => NotificationModel.fromJson(json)).toList();
    // } on DioException catch (e) {
    //   throw Exception('Failed to fetch notifications: ${e.message}');
    // }

    await Future.delayed(const Duration(milliseconds: 500));
    return [
      NotificationModel(
        title: 'Dr John sent you a message',
        description: 'Hi there...',
        time: '12:23 PM',
        date: DateTime.now(),
        type: NotificationType.message,
      ),
      NotificationModel(
        title: 'New Application Update',
        description: 'Now you can decline call easily in the...',
        time: '12:23 PM',
        date: DateTime.now(),
        type: NotificationType.update,
      ),
      NotificationModel(
        title: '\$12 Debited from Wallet',
        description: 'Call consultant with Dr John',
        time: '12:23 PM',
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.payment,
      ),
    ];
  }
}
