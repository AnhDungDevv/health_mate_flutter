import 'package:timeago/timeago.dart' as timeago;

class DateTimeUtils {
  static String timeAgo(DateTime dateTime) {
    return timeago.format(dateTime, locale: 'vi');
  }
}
