import 'package:flutter/material.dart';
import 'package:noosphere/core/theme/app_colors.dart';

class AuthToggleRichText extends StatelessWidget {
  final String text;
  final String coloredText;
  final VoidCallback onTap;
  const AuthToggleRichText({
    super.key,
    required this.text,
    required this.coloredText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: text,
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
              text: coloredText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.gradient2,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
