import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? prefixText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Function(String) onChange;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.prefixText,
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
          onChanged: (value) {
            onChange(value);
          },
          decoration: InputDecoration(
            labelText: hintText.isEmpty ? '' : hintText,
            prefixText: prefixText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey[200],
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          ),
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center,
        ),
      ],
    );
  }
}
