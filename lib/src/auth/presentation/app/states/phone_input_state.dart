class PhoneInputState {
  final String phoneNumber;
  final bool isValid;
  final bool? isRegistered;

  PhoneInputState({
    this.phoneNumber = "",
    this.isValid = false,
    this.isRegistered,
  });

  PhoneInputState copyWith(
      {String? phoneNumber, bool? isValid, bool? isRegistered}) {
    return PhoneInputState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isValid: isValid ?? this.isValid,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}
