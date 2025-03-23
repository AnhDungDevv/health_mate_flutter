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
  UnauthorizedException([this.message = "You need to log in again"]);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "No internet connection"]);
}
