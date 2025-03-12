import 'package:dio/dio.dart';
import 'package:health_mate/core/error/failure.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    return ServerFailure("Unknown error: ${error.toString()}");
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
            "Weak or lost connection, please try again.");
      case DioExceptionType.badResponse:
        return _handleServerError(error);
      case DioExceptionType.cancel:
        return const ServerFailure("Request was canceled.");
      case DioExceptionType.unknown:
      default:
        return ServerFailure("Unknown error: ${error.message}");
    }
  }

  static Failure _handleServerError(DioException error) {
    final statusCode = error.response?.statusCode;
    final message =
        error.response?.data?['message'] ?? "Server error occurred.";

    switch (statusCode) {
      case 400:
        return ServerFailure("Invalid request: $message");
      case 401:
      case 403:
        return const AuthFailure("Unauthorized access.");
      case 404:
        return const ServerFailure("Resource not found.");
      case 500:
      case 502:
      case 503:
      case 504:
        return const ServerFailure("Server is down, please try again later.");
      default:
        return ServerFailure("Server error: $message");
    }
  }
}
