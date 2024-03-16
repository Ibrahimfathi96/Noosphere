import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noosphere/core/common/widgets/custom_loader.dart';
import 'package:noosphere/core/utils/extensions.dart';
import 'package:noosphere/core/utils/show_snackbar.dart';
import 'package:noosphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:noosphere/features/auth/presentation/pages/login_screen.dart';
import 'package:noosphere/features/auth/presentation/widgets/auth_toggle_rich_text.dart';
import 'package:noosphere/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signupScreen';
  const SignUpScreen({super.key});

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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SignUpForm(),
                AuthToggleRichText(
                  text: "Already have an account? ",
                  coloredText: ' Sign In',
                  onTap: () {
                    context.pushReplacementNamed(LoginScreen.routeName);
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
