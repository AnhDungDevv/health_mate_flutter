import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[400])),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("or"),
            ),
            Expanded(child: Divider(color: Colors.grey[400])),
          ],
        ),
        const SizedBox(
          height: 16,
        ),

        // Google Login
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.g_mobiledata, size: 28),
            label: const Text("Continue with Google"),
          ),
        ),
        const SizedBox(
          height: 16,
        ),

        // Facebook Login
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.facebook, size: 28, color: Colors.blue),
            label: const Text("Continue with Facebook"),
          ),
        ),
      ],
    );
  }
}
