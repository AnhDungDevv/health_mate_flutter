import 'package:flutter_dotenv/flutter_dotenv.dart';

class PayPalConfig {
  static String get clientId => dotenv.env['IS_PRODUCTION'] == 'true'
      ? dotenv.env['PRODUCTION_CLIENT_ID']!
      : dotenv.env['SANDBOX_CLIENT_ID']!;

  static String get secret => dotenv.env['IS_PRODUCTION'] == 'true'
      ? dotenv.env['PRODUCTION_SECRET']!
      : dotenv.env['SANDBOX_SECRET']!;

  static String get baseUrl => dotenv.env['IS_PRODUCTION'] == 'true'
      ? dotenv.env['PRODUCTION_BASE_URL']!
      : dotenv.env['SANDBOX_BASE_URL']!;
}
