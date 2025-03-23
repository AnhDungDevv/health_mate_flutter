import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInButton extends StatelessWidget {
  final AsyncValue<void> signInStatus;
  final VoidCallback onPressed;

  const SignInButton(
      {super.key, required this.signInStatus, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: signInStatus.isLoading ? null : onPressed,
        child: signInStatus.isLoading
            ? const CircularProgressIndicator()
            : const Text("Continue"),
      ),
    );
  }
}
