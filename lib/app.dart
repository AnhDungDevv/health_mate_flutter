import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/app_routes.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
        child: MaterialApp(
      initialRoute: RoutesName.onboardingScreen,
      onGenerateRoute: Routes.generatedRoutes,
    ));
  }
}
