// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/modules/auth/presentation/states/providers/auth_providers.dart';
import 'package:health_mate/modules/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/modules/auth/presentation/widgets/photo_upload.dart';

class ConsultantInfoScreen extends ConsumerStatefulWidget {
  const ConsultantInfoScreen({super.key});

  @override
  _ConsultantInfoScreenState createState() => _ConsultantInfoScreenState();
}

class _ConsultantInfoScreenState extends ConsumerState<ConsultantInfoScreen> {
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
    ref.read(registrationProvider.notifier).updateData(avatar: imageUrl);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting form...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
              const SizedBox(height: 16),
              CustomInputField(
                label: 'Name',
                hintText: 'Enter your name',
                controller: nameController,
                onChange: (value) => ref
                    .read(registrationProvider.notifier)
                    .updateData(name: value),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Name is required' : null,
              ),
              CustomInputField(
                label: 'Email ID',
                hintText: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChange: (value) => ref
                    .read(registrationProvider.notifier)
                    .updateData(email: value),
                validator: Validators.validateEmail,
              ),
              CustomInputField(
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                onChange: (value) => ref
                    .read(registrationProvider.notifier)
                    .updateData(phone: value),
                validator: (value) => value == null || value.isEmpty
                    ? 'Phone number is required'
                    : null,
              ),
              CustomInputField(
                label: 'City',
                hintText: 'Enter your city',
                controller: cityController,
                keyboardType: TextInputType.text,
                onChange: (value) => ref
                    .read(registrationProvider.notifier)
                    .updateData(city: value),
                validator: (value) =>
                    value == null || value.isEmpty ? 'City is required' : null,
              ),
              CustomInputField(
                label: 'Tell me about yourself',
                hintText: 'Write something about yourself',
                controller: aboutController,
                keyboardType: TextInputType.multiline,
                onChange: (value) => ref
                    .read(registrationProvider.notifier)
                    .updateData(bio: value),
                validator: (value) => value == null || value.isEmpty
                    ? 'This field cannot be empty'
                    : null,
              ),
              CustomInputField(
                label: 'Referral Code (Optional)',
                hintText: 'Enter your referral code',
                controller: referralCodeController,
                keyboardType: TextInputType.number,
                onChange: (value) => ref
                    .read(registrationProvider.notifier)
                    .updateData(referralCode: value),
                validator: (value) =>
                    value != null && value.isNotEmpty && value.length < 6
                        ? 'Referral code should be at least 6 characters'
                        : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
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
}
