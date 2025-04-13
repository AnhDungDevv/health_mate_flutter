import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/notification/domain/entity/notification_entity.dart';
import 'package:health_mate/src/notification/presentaion/app/provider/notificationprovider.dart';

class NotificationCustomerView extends ConsumerWidget {
  const NotificationCustomerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationStateProvider);
    final notifications = state.notifications;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Notifications'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey[200],
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
                tabAlignment: TabAlignment.fill,
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'All',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NotificationList(notifications: notifications),
            NotificationList(
              notifications: notifications
                  .where((n) => n.type == NotificationType.payment)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<NotificationEntity> notifications;

  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todayNotifications = notifications
        .where((n) => n.date.day == today.day && n.date.month == today.month)
        .toList();

    final thisWeekNotifications = notifications
        .where((n) =>
            n.date.isBefore(today) &&
            n.date.isAfter(today.subtract(const Duration(days: 7))))
        .toList();

    return ListView(
      children: [
        if (todayNotifications.isNotEmpty) ...[
          const SectionHeader(title: 'Today'),
          ...todayNotifications.map((n) => NotificationTile(notification: n)),
        ],
        if (thisWeekNotifications.isNotEmpty) ...[
          const SectionHeader(title: 'This Week'),
          ...thisWeekNotifications
              .map((n) => NotificationTile(notification: n)),
        ],
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationTile({super.key, required this.notification});

  IconData _getIconForNotificationType(NotificationType type) {
    switch (type) {
      case NotificationType.payment:
        return Icons.payment;
      case NotificationType.update:
        return Icons.notifications_active;
      case NotificationType.message:
        return Icons.system_update;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_getIconForNotificationType(notification.type)),
      title: Text(notification.title),
      subtitle: Text(notification.description),
      trailing: Text(notification.time),
    );
  }
}
