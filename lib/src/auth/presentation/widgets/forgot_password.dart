import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final Function() onTap;
  const ForgotPassword({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onTap,
        child:
            const Text("Forgot Password?", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
