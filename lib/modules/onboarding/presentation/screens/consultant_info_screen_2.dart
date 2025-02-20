import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/modules/onboarding/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/modules/onboarding/presentation/widgets/schedule.dart';

class ConsultantInfoScreen2 extends StatefulWidget {
  const ConsultantInfoScreen2({super.key});

  @override
  State<ConsultantInfoScreen2> createState() => _ConsultantInfoScreenState();
}

class _ConsultantInfoScreenState extends State<ConsultantInfoScreen2> {
  final _formKey = GlobalKey<FormState>(); // ✅ Key cho form
  bool isSwitched = false;
  // ✅ Khai báo controllers cho input fields
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  @override
  void dispose() {
    // ✅ Giải phóng bộ nhớ
    categoryController.dispose();
    youtubeController.dispose();
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Thêm padding để tránh sát lề
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  const SizedBox(height: 16), // Thêm khoảng cách cho đẹp
                  const Text(
                    'Set your expertise',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  CustomInputField(
                    label: 'Category',
                    hintText: 'e.g. Doctor',
                    controller: categoryController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Name is required'
                        : null,
                  ),
                  CustomInputField(
                    label: 'Introduction Video',
                    hintText: 'Paste YouTube link here',
                    controller: youtubeController,
                    keyboardType: TextInputType.url,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Identity Proof',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Schedule',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.blue,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                      )
                    ],
                  ),
                  const TimeSchedulerScreen(),
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
              onPressed: () => context.push('/select-interest'),
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
