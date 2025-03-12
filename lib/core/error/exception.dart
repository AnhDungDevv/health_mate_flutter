class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = "Bạn cần đăng nhập lại"]);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "Không có kết nối mạng"]);
}
