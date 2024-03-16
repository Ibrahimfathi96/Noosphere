import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noosphere/core/utils/spacing.dart';
import 'package:noosphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:noosphere/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:noosphere/features/auth/presentation/widgets/auth_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
            hintText: 'Name',
            controller: _nameController,
          ),
          vGap(16),
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
            btnText: 'Sign Up',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      AuthSignUp(
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
              }
            },
          ),
          vGap(20),
        ],
      ),
    );
  }
}
