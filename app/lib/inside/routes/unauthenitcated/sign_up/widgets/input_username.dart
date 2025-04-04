import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../i18n/translations.g.dart';
import '../../../../util/validators.dart';

class SignUp_Input_Username extends StatelessWidget {
  const SignUp_Input_Username({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final label = context.t.signUp.form.username.label;
    final hint = context.t.signUp.form.username.hint;
    final emptyError = context.t.signUp.form.username.error.empty;
    final invalidError = context.t.signUp.form.username.error.invalid;

    return FTextField(
      controller: controller,
      label: Text(label),
      hint: hint,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyError;
        }

        if (!InsideUtil_Validators.isUsernameValid(value)) {
          return invalidError;
        }
        return null;
      },
    );
  }
}
