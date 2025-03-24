import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/providers/phone_provider.dart';

class PhoneInputWidget extends ConsumerWidget {
  const PhoneInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController =
        ref.watch(phoneInputProvider.notifier).phoneController;
    final sendOtpNotifier = ref.read(sendOtpProvider.notifier);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const PhoneTextField(),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              sendOtpNotifier.sendOtp(phoneController.text);
              Navigator.pushNamed(context, RoutesName.verifyPhoneView);
            },
            child: const Text("Continue",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class PhoneTextField extends ConsumerWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController =
        ref.watch(phoneInputProvider.notifier).phoneController;

    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      style: const TextStyle(fontSize: 16),
      decoration: const InputDecoration(
        hintText: "Enter your mobile number",
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
      ),
      textAlignVertical: TextAlignVertical.center,
      onChanged: (value) =>
          ref.read(phoneInputProvider.notifier).updatePhoneNumber(value),
    );
  }
}
