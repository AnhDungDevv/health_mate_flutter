import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:health_mate/core/common/styles/typography.dart';
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
            navigatorKey: GlobalNavigator.navigatorKey,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              colorScheme: lightColorScheme,
              textTheme: textTheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              textTheme: textTheme,
              useMaterial3: true,
            ),
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
