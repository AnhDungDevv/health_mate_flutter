import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalSource {
  final SharedPreferences prefs;

  AuthLocalSource(this.prefs);

  Future<void> saveToken(String token) async {
    await prefs.setString('auth_token', token);
  }

  Future<void> clearToken() async {
    await prefs.remove('auth_token');
  }
}
