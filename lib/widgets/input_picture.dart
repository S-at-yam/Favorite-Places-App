import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class InputPicture extends StatefulWidget {
  const InputPicture({super.key, required this.onPickImage});
  final void Function(File image) onPickImage;
  @override
  State<StatefulWidget> createState() {
    return _InputPictureState();
  }
}

class _InputPictureState extends State<InputPicture> {
  File? _selectedImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final imagePicked = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imagePicked == null) {
      return;
    }
    setState(() {
      _selectedImage = File(imagePicked.path);
    });

    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: Text('Take Picture'),
      icon: Icon(Icons.camera_alt),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      );
    }
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: content,
    );
  }
}
