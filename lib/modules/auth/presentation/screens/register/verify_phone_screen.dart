import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/otp/verification_notifier.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/otp/verification_state.dart';
import 'package:health_mate/modules/auth/presentation/states/providers/auth_providers.dart';
import 'package:health_mate/modules/auth/presentation/states/providers/countdown_provider.dart';
import 'package:health_mate/shared/styles/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyPhoneScreen extends ConsumerWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: _VerificationForm(),
      ),
    );
  }
}

class _VerificationForm extends ConsumerStatefulWidget {
  const _VerificationForm();

  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends ConsumerState<_VerificationForm> {
  final OtpFieldController _otpController = OtpFieldController();
  String otpCode = "";

  @override
  void dispose() {
    _otpController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countdown = ref.watch(countdownProvider);
    final authOtpState = ref.watch(authOtpNotifierProvider);
    final authOtpNotifier = ref.read(authOtpNotifierProvider.notifier);
    final phone = ref.watch(registrationProvider).data.phone;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _TitleText(),
              const _SubtitleText(),
              const SizedBox(height: 40),
              _OTPField(
                controller: _otpController,
                onChanged: (value) => setState(() => otpCode = value),
              ),
              const SizedBox(height: 20),
              _ResendRow(countdown: countdown, phone: phone!),
            ],
          ),
        ),
        _VerifyButton(
          otpCode: otpCode,
          authOtpState: authOtpState,
          authOtpNotifier: authOtpNotifier,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Enter Verification Code',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Text(
          'We have sent a 6-digit code to your phone',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class _OTPField extends StatelessWidget {
  final OtpFieldController controller;
  final Function(String) onChanged;

  const _OTPField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      controller: controller,
      fieldWidth: 50,
      fieldStyle: FieldStyle.box,
      length: 6,
      keyboardType: TextInputType.number,
      width: double.infinity,
      textFieldAlignment: MainAxisAlignment.spaceBetween,
      onChanged: onChanged,
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
  final int countdown;
  final String phone;

  const _ResendRow({required this.countdown, required this.phone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdownNotifier = ref.read(countdownProvider.notifier);
    final authOtpNotifier = ref.read(authOtpNotifierProvider.notifier);

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
              authOtpNotifier.sendOtp(phone);
              countdownNotifier.reset();
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

class _VerifyButton extends StatelessWidget {
  final String otpCode;
  final AuthOtpState authOtpState;
  final AuthOtpNotifier authOtpNotifier;

  const _VerifyButton({
    required this.otpCode,
    required this.authOtpState,
    required this.authOtpNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: otpCode.length == 6 && !authOtpState.isLoading
            ? () => authOtpNotifier.verifyOtp(
                authOtpState.verificationId ?? "", otpCode)
            : null,
        child: authOtpState.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Verify & Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
      ),
    );
  }
}
