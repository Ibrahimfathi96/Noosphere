import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const AuthTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hintText,
      ),
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }
}
