import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUpload extends StatefulWidget {
  final Function onImagePicked;

  const PhotoUpload({super.key, required this.onImagePicked});

  @override
  State<StatefulWidget> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
      widget.onImagePicked(); // Notify parent widget that image was picked
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: DottedBorder(
                      borderType: BorderType.Circle,
                      radius: const Radius.circular(50),
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue, // Màu của đường nét đứt
                      strokeWidth: 2, // Độ dày của đường nét đứt
                      child: Container(
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
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
