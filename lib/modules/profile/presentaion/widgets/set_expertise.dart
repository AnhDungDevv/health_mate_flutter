// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:health_mate/modules/auth/presentation/states/providers/auth_providers.dart';
// import 'package:health_mate/modules/auth/presentation/widgets/custom_input_field.dart';
// import 'package:health_mate/modules/profile/presentaion/widgets/upload_document.dart';
// import 'package:health_mate/modules/profile/data/model/expertise_model.dart';

// class SetExpertise extends ConsumerStatefulWidget {
//   const SetExpertise({super.key});

//   @override
//   ConsumerState<SetExpertise> createState() => _SetExpertiseState();
// }

// class _SetExpertiseState extends ConsumerState<SetExpertise> {
//   final TextEditingController controlerCategory = TextEditingController();
//   final TextEditingController controlerURLVideo = TextEditingController();
//   Future<void> pickIdentityProofFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       File file = File(result.files.single.path!);
//       ref.read(registrationProvider.notifier).updateData(
//             expertise: ExpertiseModel(
//               category:
//                   ref.read(registrationProvider).data.expertise?.category ?? '',
//               videoURL:
//                   ref.read(registrationProvider).data.expertise?.videoURL ?? '',
//               identityProofFile: file,
//             ),
//           );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final expertise = ref.read(registrationProvider).data.expertise;

//     return Column(
//       children: [
//         const Text(
//           'Set your expertise',
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//         ),
//         CustomInputField(
//           label: 'Category',
//           hintText: 'e.g. Doctor',
//           controller: controlerCategory,
//           onChange: (value) {
//             ref.read(registrationProvider.notifier).updateData(
//                   expertise: ExpertiseModel(
//                     category: value,
//                     videoURL: ref
//                             .read(registrationProvider)
//                             .data
//                             .expertise
//                             ?.videoURL ??
//                         '',
//                     identityProofFile: null,
//                   ),
//                 );
//           }, // ✅ Đóng `{}` cho `onChange`
//           validator: (value) =>
//               value == null || value.isEmpty ? 'Name is required' : null,
//         ),
//         CustomInputField(
//           onChange: (value) {
//             ref.read(registrationProvider.notifier).updateData(
//                   expertise: ExpertiseModel(
//                     category: value,
//                     videoURL: expertise?.videoURL ?? '',
//                     identityProofFile: expertise?.identityProofFile,
//                   ),
//                 );
//           },
//           label: 'Introduction Video',
//           hintText: 'Paste YouTube link here',
//           controller: controlerURLVideo,
//           keyboardType: TextInputType.url,
//           validator: (value) => null,
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           'Identity Proof',
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//         ),
//         UploadDocumentWidget(onTap: pickIdentityProofFile),
//       ],
//     );
//   }
// }
