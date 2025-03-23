import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:health_mate/core/error/error_handler.dart';
import 'package:health_mate/core/error/exception.dart';

sealed class Failure extends Equatable {
  final String message;
  final int? code; // Error code for better classification
  const Failure(this.message, [this.code]);

  @override
  List<Object?> get props => [message, code];

  // Convert Exception to Failure
  static Failure fromException(dynamic error) {
    if (error is DioException) {
      return ErrorHandler.handleDioError(error);
    } else if (error is NetworkException) {
      return NetworkFailure(error.message);
    } else if (error is CacheException) {
      return CacheFailure(error.message);
    } else if (error is UnauthorizedException) {
      return AuthFailure(error.message);
    }
    return ServerFailure("Unknown error: ${error.toString()}");
  }
}

// Specific Failure types
class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.code]);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.code]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.code]);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.code]);
}
