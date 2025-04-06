import 'dart:io';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../outside/theme/theme.dart';

class MemeUpload_Widget_ImagePicker extends StatefulWidget {
  final void Function(File) onImagePicked;

  const MemeUpload_Widget_ImagePicker({required this.onImagePicked, super.key});

  @override
  State<MemeUpload_Widget_ImagePicker> createState() =>
      _MemeUpload_Widget_ImagePickerState();
}

class _MemeUpload_Widget_ImagePickerState
    extends State<MemeUpload_Widget_ImagePicker> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final file = File(picked.path);
      setState(() {
        _pickedImage = file;
      });
      widget.onImagePicked(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_pickedImage != null)
          Image.file(
            _pickedImage!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          )
        else
          const Text('No image selected'),
        Gap(context.tokens.spacing.medium),
        FButton(
          onPress: _pickImage,
          label: const Text('Pick Image'),
          style: FButtonStyle.outline,
        ),
      ],
    );
  }
}
