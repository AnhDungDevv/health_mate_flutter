import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({super.key});

  void _navigateToOptionsScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesName.signInView);
  }

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      FontAwesomeIcons.google, // Google Icon
      FontAwesomeIcons.apple, // Apple Icon
      FontAwesomeIcons.facebook, // Facebook Icon
    ];

    return GestureDetector(
      onTap: () => _navigateToOptionsScreen(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons
              .map((icon) => Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: FaIcon(
                      icon,
                      size: 18,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
