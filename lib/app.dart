import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mate/core/routing/app_routes.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ProviderScope(
          child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.outfit().fontFamily,
          scaffoldBackgroundColor:
              Colors.white, // 🔥 Đặt màu nền trắng cho toàn bộ app
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, // 🔥 Giữ màu nền AppBar trắng
            elevation: 0, // Loại bỏ bóng nếu cần
            iconTheme: IconThemeData(color: Colors.black), // Giữ icon màu đen
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splashView,
        onGenerateRoute: Routes.generatedRoutes,
      )),
    );
  }
}
