import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../i18n/translations.g.dart';
import '../../../../util/validators.dart';

class SignUp_Input_Email extends StatelessWidget {
  const SignUp_Input_Email({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final label = context.t.signUp.form.email.label;
    final hint = context.t.signUp.form.email.hint;
    final emptyError = context.t.signUp.form.email.error.empty;
    final invalidError = context.t.signUp.form.email.error.invalid;

    return FTextField.email(
      controller: controller,
      label: Text(label),
      hint: hint,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyError;
        }

        if (!InsideUtil_Validators.isEmailValid(value)) {
          return invalidError;
        }
        return null;
      },
    );
  }
}
