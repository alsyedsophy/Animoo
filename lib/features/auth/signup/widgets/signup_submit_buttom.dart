// lib/features/auth/signup/widgets/signup_submit_button.dart
import 'dart:developer';

import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/widgets/main_buttom_widget.dart';
import 'package:flutter/material.dart';

class SignupSubmitButton extends StatelessWidget {
  const SignupSubmitButton({
    super.key,
    required this.allControllers,
    required this.isStrong,
    required this.formKey,
  });

  final Map<String, TextEditingController> allControllers;
  final bool Function(String) isStrong;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
        allControllers.values.where((e) => e != null),
      ),
      builder: (context, child) {
        final firstName = allControllers['firstName']?.text.trim() ?? '';
        final lastName = allControllers['lastName']?.text.trim() ?? '';
        final email = allControllers['email']?.text.trim() ?? '';
        final phone = allControllers['phone']?.text.trim() ?? '';
        final password = allControllers['password']?.text.trim() ?? '';
        final confirm = allControllers['confirm']?.text.trim() ?? '';

        final allField =
            firstName.isNotEmpty &&
            lastName.isNotEmpty &&
            email.isNotEmpty &&
            phone.isNotEmpty &&
            password.isNotEmpty &&
            confirm.isNotEmpty;

        final nameValide = firstName.length >= 2 && lastName.length >= 2;
        final phoneValide = phone.length == 11;
        final passwordStrong = isStrong(password);
        final passwordConfirm = password == confirm;

        final canSubmit =
            allField &&
            nameValide &&
            phoneValide &&
            passwordStrong &&
            passwordConfirm;

        return MainButtomWidget(
          title: AppConstans.signUp,
          onPressed: canSubmit
              ? () {
                  if (formKey.currentState!.validate()) {
                    log("Success Entry Fields - All Valid!");
                    // هنا هتيجي الـ API call
                  }
                }
              : null,
        );
      },
    );
  }
}
