import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/modules/auth/presentation/widgets/photo_upload.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CustomerInfoScreenState();
  }
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();
  bool _isImagePicked = false;

  // Handle form submission

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Fill your personal information',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: Column(
            children: [
              PhotoUpload(
                onImagePicked: () {
                  setState(() {
                    _isImagePicked = true;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Name'),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'John Doe',
                              border: InputBorder.none,

                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor:
                                  Colors.grey[200], // Màu nền của ô input
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Referral Code (Optional)'),
                          TextFormField(
                            controller: referralCodeController,
                            decoration: InputDecoration(
                                labelText: 'Enter your referral code',
                                border: InputBorder.none,
                                fillColor:
                                    Colors.grey[200], // Màu nền của ô input
                                filled: true, // Đảm bảo màu nền được hiển thị
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                            validator: (value) {
                              if (value != null &&
                                  value.isNotEmpty &&
                                  value.length < 6) {
                                return 'Referral code should be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
