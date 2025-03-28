import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCustomerScreen extends ConsumerWidget {
  const HomeCustomerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text("Home Customer Screen"),
      ),
    );
  }
}
