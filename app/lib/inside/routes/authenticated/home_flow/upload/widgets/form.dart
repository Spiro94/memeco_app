import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import '../../../../../../outside/theme/theme.dart';

import '../../../../../blocs/meme_upload/bloc.dart';
import '../../../../../blocs/meme_upload/state.dart';
import 'image_picker.dart';

class MemeUpload_Widget_Form extends StatefulWidget {
  final void Function(String title, File imageFile) onSubmit;

  const MemeUpload_Widget_Form({required this.onSubmit, super.key});

  @override
  State<MemeUpload_Widget_Form> createState() => _MemeUpload_Widget_FormState();
}

class _MemeUpload_Widget_FormState extends State<MemeUpload_Widget_Form> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  File? _selectedImage;
  String? noImageErrorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BlocConsumer<MemeUpload_Bloc, MemeUpload_State>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case MemeUpload_Status.success:
            context.maybePop();
          case MemeUpload_Status.failure:
          case MemeUpload_Status.loading:
          case MemeUpload_Status.idle:
            break;
        }
      },
      builder: (context, state) {
        final isLoading = state.status == MemeUpload_Status.loading;
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Upload a Meme',
                  style: theme.typography.xl.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.foreground,
                    height: 1.5,
                  ),
                ),
                Gap(context.tokens.spacing.medium),
                FTextField(
                  controller: _titleController,
                  label: const Text('Meme Title'),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Enter a title' : null,
                ),
                Gap(context.tokens.spacing.medium),
                MemeUpload_Widget_ImagePicker(
                  onImagePicked: (file) {
                    _selectedImage = file;
                  },
                ),
                if (noImageErrorMessage != null)
                  Padding(
                    padding: EdgeInsets.only(top: context.tokens.spacing.small),
                    child: Text(
                      noImageErrorMessage!,
                      textAlign: TextAlign.left,
                      style: theme.typography.sm.copyWith(
                        color: theme.colorScheme.destructive,
                      ),
                    ),
                  ),
                Gap(context.tokens.spacing.medium),
                Column(
                  children: [
                    FButton(
                      onPress: isLoading ? null : _submit,
                      label: isLoading
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.foreground,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Upload Meme'),
                      style: FButtonStyle.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedImage == null) {
        setState(() {
          noImageErrorMessage = 'Please select an image';
        });
        return;
      }
      widget.onSubmit(_titleController.text, _selectedImage!);
    }
  }
}
