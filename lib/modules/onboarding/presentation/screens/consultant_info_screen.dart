import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/modules/onboarding/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/modules/onboarding/presentation/widgets/photo_upload.dart';

class ConsultantInfoScreen extends StatefulWidget {
  const ConsultantInfoScreen({super.key});

  @override
  State<ConsultantInfoScreen> createState() => _ConsultantInfoScreenState();
}

class _ConsultantInfoScreenState extends State<ConsultantInfoScreen> {
  final _formKey = GlobalKey<FormState>(); // ✅ Key cho form
  bool _isImagePicked = false;
  // ✅ Khai báo controllers cho input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  @override
  void dispose() {
    // ✅ Giải phóng bộ nhớ
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    aboutController.dispose();
    referralCodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // ✅ Xử lý logic khi form hợp lệ
      // print("Form is valid! Submitting data...");
    } else {
      // print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    const Text(
                      'Fill your personal information',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Center(
                      child: PhotoUpload(onImagePicked: () {
                        _isImagePicked = true;
                      }),
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: 'Name',
                      hintText: 'Enter your name',
                      controller: nameController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Name is required'
                          : null,
                    ),
                    CustomInputField(
                      label: 'Email ID',
                      hintText: 'Enter your email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    CustomInputField(
                      label: 'Phone Number',
                      hintText: 'Enter your phone number',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Phone number is required'
                          : null,
                    ),
                    CustomInputField(
                      label: 'Tell me about yourself',
                      hintText: 'Write something about yourself',
                      controller: aboutController,
                      keyboardType: TextInputType.multiline,
                      validator: (value) => value == null || value.isEmpty
                          ? 'This field cannot be empty'
                          : null,
                    ),
                    CustomInputField(
                      label: 'Referral Code (Optional)',
                      hintText: 'Enter your referral code',
                      controller: referralCodeController,
                      validator: (value) =>
                          value != null && value.isNotEmpty && value.length < 6
                              ? 'Referral code should be at least 6 characters'
                              : null,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => context.push('/select-interest-2'),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
