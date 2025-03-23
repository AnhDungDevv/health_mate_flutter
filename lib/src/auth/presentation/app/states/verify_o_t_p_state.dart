class VerifyOtpState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  VerifyOtpState(
      {this.isLoading = false, this.errorMessage, this.isSuccess = false});

  VerifyOtpState copyWith(
      {bool? isLoading, String? errorMessage, bool? isSuccess}) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
