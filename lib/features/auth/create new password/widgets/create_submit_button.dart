import 'dart:developer';

import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/widgets/main_buttom_widget.dart';
import 'package:flutter/material.dart';

class CreateSubmitButton extends StatelessWidget {
  const CreateSubmitButton({
    super.key,
    required this.passController,
    required this.confirmPassController,
    required this.formKey,
    required this.isPasswordStrong,
  });
  final TextEditingController passController;
  final TextEditingController confirmPassController;
  final GlobalKey<FormState> formKey;
  final bool Function(String) isPasswordStrong;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([passController, confirmPassController]),
      builder: (context, child) {
        final hasFall =
            passController.text.isNotEmpty &&
            confirmPassController.text.isNotEmpty;
        final isStrong = isPasswordStrong(passController.text.trim());
        // final passConfirm =
        //     passController.text.trim() == confirmPassController.text.trim();
        final canSubmit = hasFall && isStrong;
        return MainButtomWidget(
          title: AppConstans.submitText,
          onPressed: canSubmit
              ? () {
                  if (formKey.currentState!.validate()) {
                    log("Success");
                  }
                }
              : null,
        );
      },
    );
  }
}
