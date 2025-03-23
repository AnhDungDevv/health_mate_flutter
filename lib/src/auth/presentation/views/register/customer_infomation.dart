import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/widgets/photo_upload.dart';

class CustomerInfoScreen extends ConsumerStatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  _CustomerInfoScreenState createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends ConsumerState<CustomerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController referralCodeController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(registrationProvider);
    nameController = TextEditingController(text: state.data.name);
    referralCodeController =
        TextEditingController(text: state.data.referralCode);
  }

  @override
  void dispose() {
    nameController.dispose();
    referralCodeController.dispose();
    super.dispose();
  }

  void handleImagePicked(String? imageUrl) {
    ref.read(registrationProvider.notifier).updateData(avatar: imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fill your personal information',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox(height: 20),
          PhotoUpload(onImagePicked: handleImagePicked),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _buildTextFormField(
                  label: 'Name',
                  controller: nameController,
                  onChanged: (value) => ref
                      .read(registrationProvider.notifier)
                      .updateData(name: value),
                  validator: Validators.validateName,
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  label: 'Referral Code (Optional)',
                  controller: referralCodeController,
                  onChanged: (value) => ref
                      .read(registrationProvider.notifier)
                      .updateData(referralCode: value),
                  validator: Validators.validateReferralCode,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
