// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/utils/navigation_helper.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_appbar.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_button.dart';
import 'package:health_mate/src/auth/presentation/widgets/option_card.dart';
import 'package:health_mate/src/profile/data/model/role.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifierStep = ref.read(signUpStepProvider.notifier);
    final notifierSignUp = ref.read(signUpProvider.notifier);
    final step = ref.watch(signUpStepProvider);
    final steps = ref.watch(signUpStepProvider.notifier).steps;
    final stepText = steps[(step - 1).clamp(0, steps.length - 1)];
    final selectedRole =
        ref.watch(signUpProvider.select((state) => state.data.role));
    void handleTap() {
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: CustomAppbar(stepText, handleTap),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _RoleSelectionPage(
                  selectedRole: selectedRole,
                  onSelectRole: notifierSignUp.setRole),
              const Spacer(),
              CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    notifierStep.nextStep();
                    Future.microtask(() {
                      NavigationHelper.navigateToNextStep(
                          context, ref.read(signUpStepProvider), selectedRole);
                    });
                  }),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}

class _RoleSelectionPage extends StatelessWidget {
  final Role selectedRole;
  final void Function(Role) onSelectRole;

  const _RoleSelectionPage({
    required this.selectedRole,
    required this.onSelectRole,
  });

  @override
  Widget build(BuildContext context) {
    final roles = [
      {
        'role': Role.customer,
        'title': 'I am looking for a Consultant',
        'subtitle': 'Search for the best consultants worldwide'
      },
      {
        'role': Role.consultant,
        'title': 'I am a Consultant Provider',
        'subtitle': 'Offer your expertise to clients worldwide'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tell us who you are and how you'd like to engage with the app",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(height: 20),
        ...roles.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: OptionCard(
                role: r['role'] as Role,
                isSelected: selectedRole == r['role'],
                title: r['title'] as String,
                subtitle: r['subtitle'] as String,
                onSelect: onSelectRole,
              ),
            )),
      ],
    );
  }
}
