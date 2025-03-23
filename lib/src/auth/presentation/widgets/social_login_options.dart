import 'package:flutter/material.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({super.key});

  void _navigateToOptionsScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.signInView);
  }

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.g_mobiledata,
      Icons.apple,
      Icons.facebook,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: icons
          .map(
            (icon) => InkWell(
              onTap: () => _navigateToOptionsScreen(context),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(icon, size: 32, color: Colors.black54),
              ),
            ),
          )
          .toList(),
    );
  }
}
