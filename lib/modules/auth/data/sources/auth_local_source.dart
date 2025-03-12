import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_mate/modules/auth/data/models/user_model.dart';

class AuthLocalSource {
  static const String _userKey = 'registered_user';
  static const String _consultantIdKey = 'consultant_id';
  static const String _timestampKey = 'user_saved_timestamp';
  static const Duration _cacheDuration = Duration(days: 7);

  /// Save user information to SharedPreferences, only store consultantId if the user has the "consultant" role
  Future<void> saveUser(UserModel user, int? consultantId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(user.toJson());

      await prefs.setString(_userKey, userJson);

      if (user.role == "consultant" && consultantId != null) {
        await prefs.setInt(_consultantIdKey, consultantId);
      } else {
        await prefs.remove(_consultantIdKey);
      }

      // Store the timestamp
      final now = DateTime.now().millisecondsSinceEpoch;
      await prefs.setInt(_timestampKey, now);
    } catch (e) {
      print("Error saving user: $e");
    }
  }

  /// Retrieve user information from SharedPreferences (automatically deletes if expired)
  Future<Map<String, dynamic>?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_userKey);
      final savedTimestamp = prefs.getInt(_timestampKey);

      if (userJson != null && savedTimestamp != null) {
        final savedTime = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
        final now = DateTime.now();

        if (now.difference(savedTime) > _cacheDuration) {
          await clearUser();
          return null;
        }

        final user = UserModel.fromJson(jsonDecode(userJson));
        final consultantId =
            user.role == "consultant" ? prefs.getInt(_consultantIdKey) : null;

        return {
          "user": user,
          "consultantId": consultantId,
        };
      }
    } catch (e) {
      print("Error retrieving user: $e");
    }
    return null;
  }

  /// Retrieve consultantId separately
  Future<int?> getConsultantId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_consultantIdKey);
    } catch (e) {
      print("Error retrieving consultantId: $e");
    }
    return null;
  }

  /// Clear user data when logging out or when expired
  Future<void> clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
      await prefs.remove(_consultantIdKey);
      await prefs.remove(_timestampKey);
    } catch (e) {
      print("Error deleting user: $e");
    }
  }
}
