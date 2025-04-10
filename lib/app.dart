import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/config/app_theme.dart';
import 'package:health_mate/core/routing/app_routes.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/core/utils/global_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.splashView,
            onGenerateRoute: Routes.generatedRoutes,
          );
        },
      ),
    );
  }
}
