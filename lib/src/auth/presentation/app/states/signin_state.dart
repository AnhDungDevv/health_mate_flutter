enum SignInStatus { idle, loading, success, failure }

class SignInState {
  final String email;
  final String password;
  final SignInStatus status;
  final String? errorMessage;

  SignInState({
    this.email = '',
    this.password = '',
    this.status = SignInStatus.idle,
    this.errorMessage,
  });

  SignInState copyWith({
    String? email,
    String? password,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
