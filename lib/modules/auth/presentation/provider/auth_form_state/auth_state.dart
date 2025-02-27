import 'package:health_mate/modules/auth/domain/entities/consultant.dart';
import 'package:health_mate/modules/auth/domain/entities/customer.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final CustomerEntity? customer;
  final ConsultantEntity? consultant;
  final String? errorMessage;

  const AuthState(
      {this.consultant,
      this.status = AuthStatus.initial,
      this.customer,
      this.errorMessage});

  AuthState copyWith({
    AuthStatus? status,
    CustomerEntity? customer,
    ConsultantEntity? consultant,
    String? errorMessage,
  }) {
    return AuthState(
        consultant: consultant ?? this.consultant,
        status: status ?? this.status,
        customer: customer ?? this.customer,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
