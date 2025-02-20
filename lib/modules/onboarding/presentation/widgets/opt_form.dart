import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OptForm extends StatefulWidget {
  const OptForm({super.key});

  @override
  State<OptForm> createState() => _OptFormState();
}

class _OptFormState extends State<OptForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      children: [
        SizedBox(
          height: 68,
          width: 64,
          child: TextField(
            style: Theme.of(context).textTheme.headlineMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        SizedBox(
          height: 68,
          width: 64,
          child: TextField(
            style: Theme.of(context).textTheme.headlineMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        )
      ],
    ));
  }
}
