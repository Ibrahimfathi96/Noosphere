import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noosphere/core/theme/app_theme.dart';
import 'package:noosphere/features/auth/presentation/pages/login_screen.dart';
import 'package:noosphere/features/auth/presentation/pages/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Noosphere',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkThemeMode,
          initialRoute: LoginScreen.routeName,
          routes: {
            LoginScreen.routeName: (_) => const LoginScreen(),
            SignUpScreen.routeName: (_) => const SignUpScreen(),
          },
        );
      },
    );
  }
}
