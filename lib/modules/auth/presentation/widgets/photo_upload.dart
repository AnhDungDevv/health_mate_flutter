import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/profile/presentaion/provider/avatar_provider.dart';

class PhotoUpload extends ConsumerWidget {
  final Function(String?) onImagePicked;

  const PhotoUpload({super.key, required this.onImagePicked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(avatarProvider);

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
            child: avatar == null
                ? Container(
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
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      avatar,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
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

  /// Hiển thị hộp thoại chọn Camera hoặc Gallery
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
                  await ref
                      .read(avatarProvider.notifier)
                      .pickImage(fromCamera: true);
                  final image = ref.watch(avatarProvider);
                  final imageURL = await ref
                      .read(avatarProvider.notifier)
                      .uploadImage(image!);
                  onImagePicked(imageURL);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Chọn từ thư viện'),
                onTap: () async {
                  Navigator.pop(context);
                  await ref
                      .read(avatarProvider.notifier)
                      .pickImage(fromCamera: false);
                  final image = ref.watch(avatarProvider);
                  final imageURL = await ref
                      .read(avatarProvider.notifier)
                      .uploadImage(image!);
                  onImagePicked(imageURL);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
