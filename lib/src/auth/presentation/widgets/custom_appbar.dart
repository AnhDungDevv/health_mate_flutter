import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String step;
  final VoidCallback onTap;

  const CustomAppbar(this.step, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: onTap, icon: const Icon(Icons.arrow_back)),
      actions: [
        Padding(padding: const EdgeInsets.all(16.0), child: Text(step))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
