import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/states/phone_input_state.dart';

class PhoneInputNotifier extends StateNotifier<PhoneInputState> {
  PhoneInputNotifier() : super(PhoneInputState());

  Timer? _debounce;
  void updatePhoneNumber(String phone) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      bool isValid = RegExp(r'^[0-9]{10}$').hasMatch(phone);
      state = state.copyWith(phoneNumber: phone, isValid: isValid);
    });
  }

  Future<void> verifyOtp(String otp) async {
    await Future.delayed(const Duration(seconds: 2));

    bool isRegistered = _mockCheckPhoneRegistered(state.phoneNumber);
    state = state.copyWith(isRegistered: isRegistered);
  }

  final TextEditingController phoneController = TextEditingController();

  bool _mockCheckPhoneRegistered(String phone) {
    return phone == "0123456789";
  }
}
