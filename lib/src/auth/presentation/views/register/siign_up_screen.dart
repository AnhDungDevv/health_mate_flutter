// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'package:health_mate/src/auth/presentation/views/register/consultant-information.dart';
import 'package:health_mate/src/auth/presentation/views/register/consultant_information_2.dart';
import 'package:health_mate/src/auth/presentation/views/register/customer_infomation.dart';
import 'package:health_mate/src/auth/presentation/views/register/customer_select_interest.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/widgets/option_card.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final isOpen = bottomInset > 0;
    ref.read(keyboardProvider.notifier).state = isOpen;
  }

  Future<void> _handleFinish(
      BuildContext context, registrationState, notifier) async {
    await notifier.register();
    if (registrationState.errorMessage == null) {
      final route = registrationState.data.role == Role.consultant
          ? RoutesName.homeConsultantView
          : RoutesName.homeCustomerView;
      Navigator.pushReplacementNamed(context, route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(registrationState.errorMessage!),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  List<Widget> _getScreensForRole(Role role) {
    return role == Role.consultant
        ? [const ConsultantInfoScreen(), const ConsultantInfoScreen2()]
        : [const CustomerInfoScreen(), const CustomerSelectInterest()];
  }

  bool _isRoleSelected(Role role) =>
      ref.watch(registrationProvider).data.role == role;

  @override
  Widget build(BuildContext context) {
    final registrationState = ref.watch(registrationProvider);
    final notifier = ref.read(registrationProvider.notifier);
    final screens = _getScreensForRole(registrationState.data.role);
    final isFinish = registrationState.currentStep == notifier.totalStep;

    return Scaffold(
      appBar: _buildAppBar(context, registrationState, notifier),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildRoleSelectionPage(notifier), ...screens],
      ),
      floatingActionButton: _buildFloatingActionButton(
          context, isFinish, registrationState, notifier),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar _buildAppBar(BuildContext context, registrationState, notifier) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (registrationState.currentStep > 0) {
            notifier.prevStep();
            _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      actions: [
        if (registrationState.currentStep == notifier.totalStep &&
            registrationState.data.role == Role.customer)
          TextButton(
            onPressed: () async {
              await notifier.register();
              if (registrationState.errorMessage == null) {
                Navigator.pushReplacementNamed(context, '/success');
              }
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          )
        else
          Text("${registrationState.currentStep} / ${notifier.totalStep}"),
      ],
    );
  }

  Widget _buildFloatingActionButton(
      BuildContext context, bool isFinish, registrationState, notifier) {
    final isKeyboardOpen = ref.watch(keyboardProvider);
    if (isKeyboardOpen) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            if (isFinish) {
              await _handleFinish(context, registrationState, notifier);
            } else {
              notifier.nextStep();
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(
            isFinish ? "Finish" : "Continue",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleSelectionPage(notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tell us who you are and how you'd like to engage with the app",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox(height: 20),
          OptionCard(
            role: Role.customer,
            isSelected: _isRoleSelected(Role.customer),
            title: "I am looking for a Consultant",
            subtitle: "Search for the best consultants worldwide",
            steps: 2,
            onSelect: (role) => notifier.updateData(role: role),
          ),
          const SizedBox(height: 20),
          OptionCard(
            role: Role.consultant,
            isSelected: _isRoleSelected(Role.consultant),
            title: "I am a Consultant Provider",
            subtitle: "Offer your expertise to clients worldwide",
            steps: 3,
            onSelect: (role) => notifier.updateData(role: role),
          ),
        ],
      ),
    );
  }
}
