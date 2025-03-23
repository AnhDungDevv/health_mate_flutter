import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return handleDioError(error);
    }
    return ServerFailure("Unknown error: ${error.toString()}");
  }

  static Failure handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
            "Weak or lost connection, please try again.", 408);

      case DioExceptionType.badResponse:
        return _handleServerError(error);

      case DioExceptionType.cancel:
        return const ServerFailure("Request was canceled.", -1);

      case DioExceptionType.unknown:
      default:
        return ServerFailure("Unknown error: ${error.message}");
    }
  }

  static Failure _handleServerError(DioException error) {
    final statusCode = error.response?.statusCode ?? 500;
    final message = error.response?.data?['message'] ?? "Server error";

    switch (statusCode) {
      case 400:
        return ServerFailure("Invalid request: $message", 400);
      case 401:
      case 403:
        return const AuthFailure("Unauthorized access", 401);
      case 404:
        return const ServerFailure("Resource not found", 404);
      case 500:
      case 502:
      case 503:
      case 504:
        return const ServerFailure("System error, please try again later", 500);
      default:
        return ServerFailure("Server error: $message", statusCode);
    }
  }
}
