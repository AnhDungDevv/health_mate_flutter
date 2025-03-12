import 'package:logger/logger.dart';

class AppLogger {
  static final Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static void info(String message) {
    logger.i(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void debug(String message) {
    logger.d(message);
  }
}
