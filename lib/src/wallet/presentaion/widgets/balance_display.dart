import 'package:flutter/material.dart';

class BalanceDisplay extends StatelessWidget {
  const BalanceDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha((0.2 * 255).toInt()),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            Icons.wallet,
            color: Theme.of(context).colorScheme.primary,
            size: 16,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            '100.06',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
