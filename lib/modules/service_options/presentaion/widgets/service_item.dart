import 'package:flutter/material.dart';
import 'package:health_mate/modules/auth/presentation/widgets/custom_input_field.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final double price;
  final bool enable;
  final ValueChanged<bool> onToggle;
  final ValueChanged<String> onPriceChanged;
  final TextEditingController controller;

  const ServiceItem({
    super.key,
    required this.title,
    required this.price,
    required this.enable,
    required this.onToggle,
    required this.onPriceChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Switch(value: enable, onChanged: onToggle),
          ],
        ),
        const SizedBox(height: 4),
        CustomInputField(
          onChange: onPriceChanged,
          label: 'Set price',
          hintText: '\$ ${price.toStringAsFixed(2)}',
          prefixText: '\$',
          controller: controller,
        ),
      ],
    );
  }
}
