import 'package:shared_preferences/shared_preferences.dart';
import 'base_storage_service.dart';

class PrefsStorageService extends BaseStorageService {
  static final PrefsStorageService _instance = PrefsStorageService._internal();

  late SharedPreferences _prefs;

  PrefsStorageService._internal();

  static PrefsStorageService get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> write(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> read(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  // Viết dữ liệu kiểu bool
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  // Đọc dữ liệu kiểu bool
  Future<bool?> getBool(String key) async {
    return _prefs.getBool(key);
  }

  // Viết dữ liệu kiểu int
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  // Đọc dữ liệu kiểu int
  Future<int?> getInt(String key) async {
    return _prefs.getInt(key);
  }

  // Viết dữ liệu kiểu double
  Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  // Đọc dữ liệu kiểu double
  Future<double?> getDouble(String key) async {
    return _prefs.getDouble(key);
  }

  // Viết dữ liệu kiểu List<String>
  Future<void> setStringList(String key, List<String> values) async {
    await _prefs.setStringList(key, values);
  }

  // Đọc dữ liệu kiểu List<String>
  Future<List<String>?> getStringList(String key) async {
    return _prefs.getStringList(key);
  }

  // Kiểm tra xem một key có tồn tại không
  Future<bool> containsKey(String key) async {
    return _prefs.containsKey(key);
  }

  // Xóa toàn bộ dữ liệu trong SharedPreferences
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
