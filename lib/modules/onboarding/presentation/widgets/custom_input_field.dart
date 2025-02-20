import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: hintText,
            border: InputBorder.none,
            fillColor: Colors.grey[200], // Màu nền của ô input
            filled: true, // Đảm bảo màu nền hiển thị
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
