import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/notifiers/phone_notifier.dart';
import 'package:health_mate/src/auth/presentation/app/states/phone_input_state.dart';

final phoneInputProvider =
    StateNotifierProvider<PhoneInputNotifier, PhoneInputState>(
  (ref) => PhoneInputNotifier(),
);

final otpInputProvider = StateProvider<String>((ref) => '');
