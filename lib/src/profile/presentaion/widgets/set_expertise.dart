import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/src/profile/presentaion/widgets/upload_file.dart';

class SetExpertise extends ConsumerStatefulWidget {
  const SetExpertise({super.key});

  @override
  ConsumerState<SetExpertise> createState() => _SetExpertiseState();
}

class _SetExpertiseState extends ConsumerState<SetExpertise> {
  final TextEditingController controlerCategory = TextEditingController();
  final TextEditingController controlerURLVideo = TextEditingController();
  Future<void> pickIdentityProofFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Set your expertise',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        CustomInputField(
          label: 'Category',
          hintText: 'e.g. Doctor',
          controller: controlerCategory,
          onChange: (value) {}, // ✅ Đóng `{}` cho `onChange`
          validator: (value) =>
              value == null || value.isEmpty ? 'Name is required' : null,
        ),
        CustomInputField(
          onChange: (value) {},
          label: 'Introduction Video',
          hintText: 'Paste YouTube link here',
          controller: controlerURLVideo,
          keyboardType: TextInputType.url,
          validator: (value) => null,
        ),
        const SizedBox(height: 10),
        const Text(
          'Identity Proof',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        UploadDocumentWidget(onTap: pickIdentityProofFile),
      ],
    );
  }
}
