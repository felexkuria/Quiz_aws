import 'package:flutter/material.dart';

class TextFormfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final bool isPassword;
  const TextFormfield(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator,
      this.isPassword = false});
  @override
  Widget build(BuildContext context) {
    // Wrap TextFormField with Material widget to provide required Material ancestor
    return Material(
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.grey[800]),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.black87, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red.shade300, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red.shade300, width: 1),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        validator: validator,
      ),
    );
  }
}
