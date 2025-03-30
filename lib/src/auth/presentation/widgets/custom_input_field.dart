import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final String? prefixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final bool obscureText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final InputDecoration? inputDecoration;

  const CustomInputField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.onChange,
    this.focusNode,
    this.onFieldSubmitted,
    this.prefixText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.labelStyle,
    this.textStyle,
    this.inputDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: labelStyle ??
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          onChanged: onChange,
          style: textStyle ?? const TextStyle(fontSize: 14),
          decoration: inputDecoration ??
              InputDecoration(
                hintText: hintText,
                prefixText: prefixText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
              ),
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
