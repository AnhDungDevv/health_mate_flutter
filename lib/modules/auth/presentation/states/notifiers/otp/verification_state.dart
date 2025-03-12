class AuthOtpState {
  final bool isLoading;
  final String? verificationId;
  final String? errorMessage;

  AuthOtpState(
      {this.isLoading = false, this.verificationId, this.errorMessage});

  AuthOtpState copyWith({
    bool? isLoading,
    String? verificationId,
    String? errorMessage,
  }) {
    return AuthOtpState(
      isLoading: isLoading ?? this.isLoading,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
