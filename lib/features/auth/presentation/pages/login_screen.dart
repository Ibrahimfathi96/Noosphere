import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noosphere/core/common/widgets/custom_loader.dart';
import 'package:noosphere/core/utils/extensions.dart';
import 'package:noosphere/core/utils/show_snackbar.dart';
import 'package:noosphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:noosphere/features/auth/presentation/pages/signup_screen.dart';
import 'package:noosphere/features/auth/presentation/widgets/auth_toggle_rich_text.dart';
import 'package:noosphere/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackbar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CustomLoader();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const LoginForm(),
                AuthToggleRichText(
                  text: "Don't have an account? ",
                  coloredText: ' Sign Up',
                  onTap: () {
                    context.pushReplacementNamed(SignUpScreen.routeName);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
