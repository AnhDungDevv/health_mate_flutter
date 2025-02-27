import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/consultant/consultant_info_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/consultant/consultant_info_screen_2.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/customer/customer_info_screen.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/customer/select_interest_screen.dart';
import 'package:health_mate/modules/auth/presentation/widgets/option_card.dart';

enum Role { consultant, customer }

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final PageController _pageController = PageController();
  Role? _selectedRole;
  int _currentStep = 0;
  List<Widget> _screenSignUp = [];
  int _totalStep = 1;
  late bool isFinish = _currentStep == _totalStep;

  void _setRole(Role role) {
    setState(() {
      _selectedRole = role;
      _currentStep = 1;
      _screenSignUp = _getScreensForRole(role);
      _totalStep = _screenSignUp.length + 1;
    });
  }

  void _nextPage() {
    if (_selectedRole == null) {
      return;
    }
    if (_currentStep < _totalStep) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      print("Đăng ký hoàn tất!");
    }
  }

  void _prevPage() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pop(context);
    }
  }

  List<Widget> _getScreensForRole(Role role) {
    if (role == Role.consultant) {
      return [const ConsultantInfoScreen(), const ConsultantInfoScreen2()];
    } else {
      return [const CustomerInfoScreen(), const SelectInterestScreen()];
    }
  }

  bool isRoleSelected(Role role) => _selectedRole == role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: _prevPage,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          (_currentStep == _totalStep && _selectedRole == Role.customer)
              ? TextButton(
                  onPressed: () {},
                  child: const Text(
                    "skip",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ))
              : (_selectedRole != null
                  ? Text("$_currentStep / $_totalStep")
                  : const SizedBox())
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildRoleSelectionPage(), ..._screenSignUp],
      ),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16), // Thêm padding hai bên
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
            onPressed: (_selectedRole == null || _currentStep > _totalStep)
                ? null
                : _nextPage,
            child: Text(
              isFinish ? "Finish" : "Continue",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Đặt vị trí trung tâm dưới
    );
  }

  Widget _buildRoleSelectionPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              const Text(
                "Tell us who you are and how you'd like to engage with the app",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 20),
              OptionCard(
                role: Role.customer,
                isSelected: isRoleSelected(Role.customer),
                title: "I am looking for Consultant",
                subtitle: "Search your best consultant around the world",
                steps: 2,
                onSelect: _setRole,
              ),
              const SizedBox(height: 20),
              OptionCard(
                role: Role.consultant,
                isSelected: isRoleSelected(Role.consultant),
                title: "I am a Consultant Provider",
                subtitle: "Search your best consultant around the world",
                steps: 3,
                onSelect: _setRole,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
