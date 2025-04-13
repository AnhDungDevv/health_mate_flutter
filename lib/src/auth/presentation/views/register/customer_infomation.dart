import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_mate/core/utils/validators.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/utils/navigation_helper.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_appbar.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_button.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/src/auth/presentation/widgets/photo_upload.dart';
import 'package:health_mate/src/profile/data/model/role.dart';

class CustomerInfoScreen extends ConsumerWidget {
  const CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(signUpStepProvider);
    final signUpState = ref.watch(signUpProvider);
    final steps = ref.read(signUpStepProvider.notifier).steps;
    final stepText = steps[(step - 1).clamp(0, steps.length - 1)];

    return Scaffold(
      appBar: CustomAppbar(stepText, () {
        ref.read(signUpStepProvider.notifier).previousStep();
        Navigator.pop(context);
      }),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Fill your personal information',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  _PhotoUploadWidget(),
                  SizedBox(height: 20),
                  _FormWidget(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavigationBar(signUpState.data.role),
    );
  }
}

// 🟢 Tách PhotoUpload thành Widget riêng để tránh rebuild
class _PhotoUploadWidget extends ConsumerWidget {
  const _PhotoUploadWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: PhotoUpload(
        onImagePicked: (imageUrl) =>
            ref.read(signUpProvider.notifier).updateData(avatar: imageUrl),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) {
    return const Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          _NameInputField(),
          SizedBox(height: 20),
          _ReferralCodeInputField(),
        ],
      ),
    );
  }
}

class _NameInputField extends ConsumerStatefulWidget {
  const _NameInputField();

  @override
  ConsumerState<_NameInputField> createState() => _NameInputFieldState();
}

class _NameInputFieldState extends ConsumerState<_NameInputField> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    final name = ref.read(signUpProvider).data.name ?? '';
    nameController = TextEditingController(text: name);
  }

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Name',
      labelStyle: Theme.of(context).textTheme.labelMedium,
      controller: nameController,
      onChange: (value) =>
          ref.read(signUpProvider.notifier).updateData(name: value),
      validator: Validators.validateName,
      inputDecoration: _inputDecoration('Enter your name', context),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}

class _ReferralCodeInputField extends ConsumerStatefulWidget {
  const _ReferralCodeInputField();

  @override
  ConsumerState<_ReferralCodeInputField> createState() =>
      _ReferralCodeInputFieldState();
}

class _ReferralCodeInputFieldState
    extends ConsumerState<_ReferralCodeInputField> {
  late TextEditingController referralCodeController;

  @override
  void initState() {
    super.initState();
    final referralCode = ref.read(signUpProvider).data.referralCode ?? '';
    referralCodeController = TextEditingController(text: referralCode);
  }

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Referral Code (Optional)',
      labelStyle: TextStyle(fontSize: 14.w),
      controller: referralCodeController,
      onChange: (value) =>
          ref.read(signUpProvider.notifier).updateData(referralCode: value),
      validator: Validators.validateReferralCode,
      inputDecoration: _inputDecoration('Enter your referral code', context),
    );
  }

  @override
  void dispose() {
    referralCodeController.dispose();
    super.dispose();
  }
}

InputDecoration _inputDecoration(String hintText, BuildContext context) {
  return InputDecoration(
    hintText: hintText,
    hintStyle:
        TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.outline),
    filled: true,
    fillColor: Theme.of(context).colorScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide.none,
    ),
  );
}

class _BottomNavigationBar extends ConsumerWidget {
  final Role role;

  const _BottomNavigationBar(this.role);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: CustomButton(
        label: 'Continue',
        onPressed: () {
          ref.read(signUpStepProvider.notifier).nextStep();
          Future.microtask(() {
            final updatedStep = ref.read(signUpStepProvider);
            if (!context.mounted) return;
            NavigationHelper.navigateToNextStep(context, updatedStep, role);
          });
        },
      ),
    );
  }
}
