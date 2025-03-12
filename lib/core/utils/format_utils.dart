import 'package:intl/intl.dart';

class Formatter {
  static String formatCurrency(num value) {
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return formatter.format(value);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }
}
