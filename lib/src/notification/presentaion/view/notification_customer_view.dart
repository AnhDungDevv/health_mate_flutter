import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationProvider = Provider<List<NotificationItem>>((ref) {
  // Replace with your data fetching logic
  return [
    NotificationItem(
      title: 'Dr John sent you a message',
      description: 'Hi there...',
      time: '12:23 PM',
      date: DateTime.now(),
      type: NotificationType.message,
    ),
    NotificationItem(
      title: 'New Application Update',
      description: 'Now you can decline call easily in the...',
      time: '12:23 PM',
      date: DateTime.now(),
      type: NotificationType.update,
    ),
    NotificationItem(
      title: '\$12 Debited from Wallet',
      description: 'Call consultant with Dr John',
      time: '12:23 PM',
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.payment,
    ),
    NotificationItem(
      title: '\$120 Credited to Wallet',
      description: '',
      time: '12:23 PM',
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.payment,
    ),
  ];
});

class NotificationCustomerView extends ConsumerWidget {
  const NotificationCustomerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);

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
  final List<NotificationItem> notifications;

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
  final NotificationItem notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(notification.type.icon),
      title: Text(notification.title),
      subtitle: Text(notification.description),
      trailing: Text(notification.time),
    );
  }
}

enum NotificationType { message, update, payment }

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

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final DateTime date;
  final NotificationType type;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.type,
  });
}
