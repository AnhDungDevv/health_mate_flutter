class SendOTPState {
  final bool? isLoading;
  final String? verificationId;
  final String? errorMessage;

  SendOTPState(
      {this.isLoading = false, this.verificationId, this.errorMessage});

  SendOTPState copyWith(
      {bool? isLoading, String? verificationId, String? errorMessage}) {
    return SendOTPState(
      isLoading: isLoading ?? this.isLoading,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
