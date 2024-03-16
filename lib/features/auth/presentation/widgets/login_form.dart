import 'package:flutter/material.dart';
import 'package:noosphere/core/utils/spacing.dart';
import 'package:noosphere/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:noosphere/features/auth/presentation/widgets/auth_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          vGap(30),
          AuthTextFormField(
            hintText: 'Email',
            controller: _emailController,
          ),
          vGap(16),
          AuthTextFormField(
            hintText: 'Password',
            controller: _passwordController,
            obscureText: true,
          ),
          vGap(20),
          AuthGradientButton(
            btnText: 'Sign In',
            onPressed: () {},
          ),
          vGap(20),
        ],
      ),
    );
  }
}
