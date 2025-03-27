import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_appbar.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/views/customer_select_interest.dart';

class CustomerSelectInterest extends ConsumerWidget {
  const CustomerSelectInterest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleTap() {
      ref.read(signUpStepProvider.notifier).previousStep();
      Navigator.pop(context);
    }

    final step = ref.watch(signUpStepProvider);
    final steps = ref.watch(signUpStepProvider.notifier).steps;
    final stepText = steps[(step - 1).clamp(0, steps.length - 1)];
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: CustomAppbar(stepText, handleTap),
        body: const SelectInterestList());
  }
}
