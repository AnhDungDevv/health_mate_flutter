import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/profile/profile_provider.dart';

class PhotoUpload extends ConsumerWidget {
  final Function(String?) onImagePicked;

  const PhotoUpload({super.key, required this.onImagePicked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarState = ref.watch(avatarProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _showImagePicker(context, ref),
          child: DottedBorder(
            borderType: BorderType.Circle,
            radius: const Radius.circular(50),
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            strokeWidth: 2,
            child: avatarState.when(
              data: (avatarUrl) => avatarUrl == null
                  ? _buildPlaceholder()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        avatarUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
              loading: () => const CircularProgressIndicator(),
              error: (e, stackTrace) => _buildErrorPlaceholder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Upload photo',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.upload_file,
        color: Colors.blue,
        size: 40,
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red[100],
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.error,
        color: Colors.red,
        size: 40,
      ),
    );
  }

  void _showImagePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Chụp ảnh'),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickAndUploadImage(ref, fromCamera: true);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Chọn từ thư viện'),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickAndUploadImage(ref, fromCamera: false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAndUploadImage(WidgetRef ref,
      {required bool fromCamera}) async {
    final notifier = ref.read(avatarProvider.notifier);
    await notifier.pickImage(fromCamera: fromCamera);
  }
}
