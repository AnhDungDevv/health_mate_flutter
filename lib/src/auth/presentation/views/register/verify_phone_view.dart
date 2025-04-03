import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/app/providers/phone_provider.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/providers/countdown_provider.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:health_mate/src/auth/presentation/app/states/verify_o_t_p_state.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyPhoneScreen extends ConsumerStatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends ConsumerState<VerifyPhoneScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(countdownProvider.notifier).startCountdown();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ref.read(phoneInputProvider).phoneNumber;
    final sendOtpNotifier = ref.read(sendOtpProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushNamed(context, RoutesName.onboardingView);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Enter Verification Code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'We have sent a 6-digit code to your phone',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const _OTPField(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const _CountdownText(),
                const SizedBox(width: 5),
                Consumer(
                  builder: (_, ref, __) {
                    final countdown = ref.watch(countdownProvider);
                    return countdown == 0
                        ? GestureDetector(
                            onTap: () {
                              ref.read(countdownProvider.notifier).reset();
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
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
            const Spacer(),
            const _VerifyButton(),
            const SizedBox(
              height: 10,
            )
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
    return OTPTextField(
      fieldWidth: 50,
      fieldStyle: FieldStyle.box,
      length: 6,
      keyboardType: TextInputType.number,
      width: double.infinity,
      textFieldAlignment: MainAxisAlignment.spaceBetween,
      onChanged: (value) => ref.read(otpInputProvider.notifier).state = value,
      outlineBorderRadius: 5,
      otpFieldStyle: OtpFieldStyle(
        borderColor: Theme.of(context).colorScheme.outline,
        enabledBorderColor: Colors.grey.shade300,
        focusBorderColor: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}

class _VerifyButton extends ConsumerWidget {
  const _VerifyButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpCode = ref.watch(otpInputProvider);
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
            ? () => {
                  verifyOtpNotifier.verifyOtp(otpCode),
                  ref.listen<VerifyOtpState>(verifyOtpProvider,
                      (previous, next) {
                    if (next.isSuccess) {
                      Navigator.pushReplacementNamed(
                          context, RoutesName.signUpView);
                    }
                  })
                }
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

class _CountdownText extends ConsumerWidget {
  const _CountdownText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownProvider);

    return Text(
      countdown > 0
          ? 'Resend in 00:${countdown.toString().padLeft(2, '0')}'
          : 'Didn\'t receive code?',
      style: const TextStyle(fontSize: 14, color: Colors.grey),
    );
  }
}
