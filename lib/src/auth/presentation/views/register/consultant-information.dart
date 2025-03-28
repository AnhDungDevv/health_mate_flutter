import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/providers/usedebounce_provider.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/src/auth/presentation/widgets/photo_upload.dart';

class ConsultantInfoView1 extends ConsumerStatefulWidget {
  const ConsultantInfoView1({super.key});

  @override
  _ConsultantInfoView1State createState() => _ConsultantInfoView1State();
}

class _ConsultantInfoView1State extends ConsumerState<ConsultantInfoView1> {
  final _formKey = GlobalKey<FormState>();

  late final List<TextEditingController> _controllers;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController cityController;
  late final TextEditingController aboutController;
  late final TextEditingController referralCodeController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    cityController = TextEditingController();
    aboutController = TextEditingController();
    referralCodeController = TextEditingController();

    _controllers = [
      nameController,
      emailController,
      phoneController,
      cityController,
      aboutController,
      referralCodeController,
    ];
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void handleImagePicked(String? imageUrl) {
    ref.read(signUpProvider.notifier).updateData(avatar: imageUrl);
  }

  void _handleInputChange(WidgetRef ref, String field, String value) {
    ref.read(debounceInputProvider(field).notifier).state = null;
    Future.delayed(const Duration(milliseconds: 500), () {
      // ref.read(signUpProvider.notifier).updateDataField(field, value);
    });
  }

  void _submitForm(
      BuildContext context, WidgetRef ref, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting form...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fill your personal information',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Center(child: PhotoUpload(onImagePicked: handleImagePicked)),
              _buildInputField(
                  ref, 'name', 'Name', 'Enter your name', Validators.notEmpty),
              _buildInputField(ref, 'email', 'Email ID', 'Enter your email',
                  Validators.validateEmail, TextInputType.emailAddress),
              _buildInputField(
                  ref,
                  'phone',
                  'Phone Number',
                  'Enter your phone number',
                  Validators.notEmpty,
                  TextInputType.phone),
              _buildInputField(
                  ref, 'city', 'City', 'Enter your city', Validators.notEmpty),
              _buildInputField(
                  ref,
                  'bio',
                  'Tell me about yourself',
                  'Write something about yourself',
                  Validators.notEmpty,
                  TextInputType.multiline),
              _buildInputField(
                  ref,
                  'referralCode',
                  'Referral Code (Optional)',
                  'Enter your referral code',
                  (value) =>
                      value != null && value.isNotEmpty && value.length < 6
                          ? 'Referral code should be at least 6 characters'
                          : null,
                  TextInputType.number),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Submit'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(WidgetRef ref, String field, String label,
      String hint, String? Function(String?) validator,
      [TextInputType? keyboardType]) {
    // final value =
    //     ref.watch(signUpProvider.select((state) => state[field] ?? ''));

    final controller = TextEditingController();

    return CustomInputField(
      label: label,
      hintText: hint,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      onChange: (val) => _handleInputChange(ref, field, val),
      validator: validator,
    );
  }
}
