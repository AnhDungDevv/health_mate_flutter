import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupMainScreen extends StatelessWidget {
  final Widget child;

  const SignupMainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: child,
    );
  }
}
