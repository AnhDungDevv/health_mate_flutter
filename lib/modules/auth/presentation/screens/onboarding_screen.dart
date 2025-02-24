import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/modules/auth/presentation/widgets/slider_onboarding.dart';
import 'package:health_mate/shared/styles/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp _phoneRegex = RegExp(r'^\d{7,15}$');
  String selectedCountryCode = '+84';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Expanded(child: SliderOnboarding()),
            const SizedBox(height: 40),

            Form(
              key: _formKey,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            selectedCountryCode = country.dialCode ?? '+84';
                          });
                        },
                        initialSelection: selectedCountryCode,
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: const ['+1', '+84'],
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      // Divider
                      Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey.shade400,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                            hintText: "Enter your mobile number",
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            if (!_phoneRegex.hasMatch(value.trim())) {
                              return 'Invalid phone number format';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.push('/verify-phone');
                } else {}
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),

            // OR
            const Text("or",
                style: TextStyle(fontSize: 14, color: Colors.grey)),

            const SizedBox(height: 16),

            // Nút đăng nhập bằng Google, Apple, Facebook
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 32),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.apple, size: 32),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook, size: 32),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "By continuing you agree to the Terms of Service and Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
