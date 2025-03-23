import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/providers/input_provider.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/providers/countdown_provider.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Verification Code',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'We have sent a 6-digit code to your phone',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 40),
                  _OTPField(),
                  SizedBox(height: 20),
                  _ResendRow(),
                ],
              ),
            ),
            _VerifyButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _OTPField extends ConsumerWidget {
  const _OTPField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = OtpFieldController();

    return OTPTextField(
      controller: otpController,
      fieldWidth: 50,
      fieldStyle: FieldStyle.box,
      length: 6,
      keyboardType: TextInputType.number,
      width: double.infinity,
      textFieldAlignment: MainAxisAlignment.spaceBetween,
      onChanged: (value) => ref.read(otpInputProvider.notifier).state = value,
      outlineBorderRadius: 5,
      otpFieldStyle: OtpFieldStyle(
        borderColor: AppColors.secondary,
        enabledBorderColor: Colors.grey.shade300,
        focusBorderColor: AppColors.secondary,
      ),
    );
  }
}

class _ResendRow extends ConsumerWidget {
  const _ResendRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownProvider);
    final phoneNumber = ref.read(phoneInputProvider).phoneNumber;
    final countdownNotifier = ref.read(countdownProvider.notifier);
    final sendOtpNotifier = ref.read(sendOtpProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          countdown > 0
              ? 'Resend in 00:${countdown.toString().padLeft(2, '0')}'
              : 'Didn\'t receive code?',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(width: 5),
        if (countdown == 0)
          GestureDetector(
            onTap: () {
              countdownNotifier.reset();
              sendOtpNotifier.sendOtp(phoneNumber);
            },
            child: const Text(
              'Resend',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
      ],
    );
  }
}

class _VerifyButton extends ConsumerWidget {
  const _VerifyButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpCode = ref.watch(otpInputProvider);
    final verificationId = ref.read(sendOtpProvider).verificationId;
    final verifyOtpState = ref.watch(verifyOtpProvider);
    final verifyOtpNotifier = ref.read(verifyOtpProvider.notifier);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: otpCode.length == 6 && !verifyOtpState.isLoading
            ? () => verifyOtpNotifier.verifyOtp(verificationId ?? "", otpCode)
            : null,
        child: verifyOtpState.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Verify & Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
      ),
    );
  }
}
