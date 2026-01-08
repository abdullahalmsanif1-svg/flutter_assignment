import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromCamera() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null
              ? const Text('لم يتم اختيار صورة')
              : Image.file(_image!, height: 200),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: pickFromCamera,
            child: const Text('التقاط صورة بالكاميرا'),
          ),

          ElevatedButton(
            onPressed: pickFromGallery,
            child: const Text('اختيار صورة من المعرض'),
          ),
        ],
      ),
    );
  }
}