import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/utils/navigation_helper.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_appbar.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_button.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';
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
    final state = ref.read(signUpProvider);
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
    ref.read(signUpProvider.notifier).updateData(avatar: imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    void handleTap() {
      ref.read(signUpStepProvider.notifier).previousStep();
      Navigator.pop(context);
    }

    final notifierStep = ref.read(signUpStepProvider.notifier);
    final signUp = ref.read(signUpProvider);
    final step = ref.watch(signUpStepProvider);
    final steps = ref.watch(signUpStepProvider.notifier).steps;
    final stepText = steps[(step - 1).clamp(0, steps.length - 1)];

    return Scaffold(
      appBar: CustomAppbar(stepText, handleTap),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fill your personal information',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Center(
              child: PhotoUpload(onImagePicked: handleImagePicked),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  CustomInputField(
                    label: 'Name',
                    labelStyle: TextStyle(
                        fontSize: 14.w, fontWeight: FontWeight.normal),
                    controller: nameController,
                    onChange: (value) => ref
                        .read(signUpProvider.notifier)
                        .updateData(name: value),
                    validator: Validators.validateName,
                    inputDecoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: AppColors.grey),
                      filled: true,
                      fillColor: AppColors.lightGrey,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    label: 'Referral Code (Optional)',
                    labelStyle: TextStyle(
                        fontSize: 14.w, fontWeight: FontWeight.normal),
                    controller: referralCodeController,
                    onChange: (value) => ref
                        .read(signUpProvider.notifier)
                        .updateData(referralCode: value),
                    validator: Validators.validateReferralCode,
                    inputDecoration: InputDecoration(
                      hintText: 'Enter your referral code',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: AppColors.grey),
                      filled: true,
                      fillColor: AppColors.lightGrey,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
                label: 'Continue',
                onPressed: () {
                  notifierStep.nextStep();
                  Future.microtask(() {
                    final updatedStep = ref.read(signUpStepProvider);
                    NavigationHelper.navigateToNextStep(
                        context, updatedStep, signUp.data.role);
                  });
                }),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
