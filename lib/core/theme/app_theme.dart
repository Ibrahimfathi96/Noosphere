import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noosphere/core/theme/app_colors.dart';

class AppTheme {
  static _darkBorder([Color color = AppColors.borderColor]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.r,
          ),
        ),
        borderSide: BorderSide(
          color: color,
          width: 3.0,
        ),
      );
  static final ThemeData darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,

    //Appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
    ),

    // Input decorations
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(28.0),
      border: _darkBorder(),
      enabledBorder: _darkBorder(),
      focusedBorder: _darkBorder(
        AppColors.gradient2,
      ),
    ),
  );
}
