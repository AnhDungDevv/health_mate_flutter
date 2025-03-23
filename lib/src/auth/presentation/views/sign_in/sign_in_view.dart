import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/src/auth/presentation/widgets/forgot_password.dart';
import 'package:health_mate/src/auth/presentation/widgets/sign_in_button.dart';
import 'package:health_mate/src/auth/presentation/widgets/social_login_buttons.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final signInNotifier = ref.read(signInProvider.notifier);
    final signInStatus = ref.watch(signInStatusProvider);

    final emailController = TextEditingController(text: signInState.email);
    final passwordController =
        TextEditingController(text: signInState.password);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sign In",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 16,
                  ),

                  // Email Field
                  CustomInputField(
                    label: "Email",
                    hintText: "example@email.com",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChange: signInNotifier.updateEmail,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Password Field
                  CustomInputField(
                    label: "Password",
                    hintText: "Min 8 characters",
                    controller: passwordController,
                    obscureText: true,
                    onChange: signInNotifier.updatePassword,
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Forgot Password
                  ForgotPassword(
                    onTap: () {},
                  ),

                  // Sign In Button
                  SignInButton(
                    signInStatus: signInStatus,
                    onPressed: () async {
                      await ref.read(signInStatusProvider.notifier).signIn(
                            emailController.text,
                            passwordController.text,
                          );
                    },
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  const SocialLoginButtons(),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "By continuing you agree to the Terms of Service and Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            // Loading overlay
            if (signInStatus.isLoading)
              Container(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            if (signInStatus.hasError)
              Center(
                child: Text(
                  signInStatus.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
