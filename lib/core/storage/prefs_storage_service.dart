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
}
