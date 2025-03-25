import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/states/signin_state.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/src/auth/presentation/widgets/forgot_password.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_button.dart';
import 'package:health_mate/src/auth/presentation/widgets/social_login_buttons.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final signInState = ref.read(signInProvider);
    {}
    _emailController = TextEditingController(text: signInState.email);
    _passwordController = TextEditingController(text: signInState.password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ref.read(signInProvider.notifier).signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInProvider);
    final signInNotifier = ref.read(signInProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text("Sign In",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  /// Email Input
                  CustomInputField(
                    label: "Email",
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    controller: _emailController,
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    onChange: signInNotifier.updateEmail,
                    validator: Validators.validateEmail,
                    inputDecoration: _inputDecoration("example@email.com"),
                    onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
                  ),
                  const SizedBox(height: 16),

                  /// Password Input
                  CustomInputField(
                    label: "Password",
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: true,
                    onChange: signInNotifier.updatePassword,
                    validator: Validators.validatePassword,
                    onFieldSubmitted: (_) => _submitForm(),
                    inputDecoration: _inputDecoration("Min 8 character"),
                  ),

                  ForgotPassword(onTap: () {}),

                  /// Sign In Button
                  CustomButton(
                    label: 'Continue',
                    onPressed: _submitForm,
                  ),

                  const SizedBox(height: 16),
                  _buildOrDivider(),
                  const SizedBox(height: 16),

                  /// Social Login Buttons
                  const _SocialLoginButtons(),

                  const SizedBox(height: 16),

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
          ),

          /// Loading Overlay
          if (signInState.status == SignInStatus.loading)
            const _LoadingOverlay(),

          /// Error Message
          if (signInState.status == SignInStatus.failure)
            Center(
              child: Text(
                signInState.errorMessage ?? "Đã có lỗi xảy ra!",
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  /// Input Decoration Helper
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildOrDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            thickness: 1.2,
            color: Colors.grey,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child:
                Text("or", style: TextStyle(fontSize: 14, color: Colors.grey)),
          ),
          Expanded(
            child: Divider(thickness: 1.2, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

/// Loading Overlay Widget
class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ModalBarrier(
          dismissible: false,
          color: Colors.black45,
        ),
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

/// Social Login Buttons
class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          icon: FontAwesomeIcons.google,
          iconColor: Colors.red,
          text: 'Continue with Google',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        SocialButton(
          icon: FontAwesomeIcons.facebook,
          iconColor: Colors.blue,
          text: 'Continue with Facebook',
          onPressed: () {},
        ),
      ],
    );
  }
}
