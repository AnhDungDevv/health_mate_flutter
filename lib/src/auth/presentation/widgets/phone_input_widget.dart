import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/providers/phone_provider.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_button.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';

class PhoneInputWidget extends ConsumerStatefulWidget {
  const PhoneInputWidget({super.key});

  @override
  ConsumerState<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends ConsumerState<PhoneInputWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final phoneController =
        ref.watch(phoneInputProvider.notifier).phoneController;
    final sendOtpNotifier = ref.read(sendOtpProvider.notifier);

    return Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        children: [
          const PhoneTextField(),
          CustomButton(
              label: 'Continue',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  sendOtpNotifier.sendOtp(phoneController.text);
                  Navigator.pushNamed(context, RoutesName.verifyPhoneView);
                }
              })
        ],
      ),
    );
  }
}

class PhoneTextField extends ConsumerWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController =
        ref.watch(phoneInputProvider.notifier).phoneController;

    return CustomInputField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      validator: Validators.validatePhone,
      onChange: (value) =>
          ref.read(phoneInputProvider.notifier).updatePhoneNumber(value),
      inputDecoration: InputDecoration(
        hintText: "Enter your mobile number",
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
