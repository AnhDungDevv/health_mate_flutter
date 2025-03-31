abstract class BaseStorageService {
  static final BaseStorageService _instance = _StorageImplementation();

  static BaseStorageService get instance => _instance;

  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
}

class _StorageImplementation extends BaseStorageService {
  _StorageImplementation();

  @override
  Future<void> write(String key, String value) async {
    throw UnimplementedError();
  }

  @override
  Future<String?> read(String key) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String key) async {
    throw UnimplementedError();
  }
}
