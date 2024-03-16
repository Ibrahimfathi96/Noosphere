import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noosphere/core/theme/app_colors.dart';
import 'package:noosphere/core/utils/extensions.dart';

class AuthGradientButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const AuthGradientButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        gradient: const LinearGradient(
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.transparentColor,
          backgroundColor: AppColors.transparentColor,
          fixedSize: Size(
            context.width,
            context.height * 0.06,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
