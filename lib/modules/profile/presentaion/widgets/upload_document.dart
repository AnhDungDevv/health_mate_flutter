import 'package:flutter/material.dart';

class UploadDocumentWidget extends StatelessWidget {
  final VoidCallback onTap;

  const UploadDocumentWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.upload_file,
              color: Colors.orange,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              "Upload Documents",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
