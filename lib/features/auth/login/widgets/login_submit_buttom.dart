import 'dart:developer';

import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/widgets/main_buttom_widget.dart';
import 'package:flutter/material.dart';

class LoginSubmitButtom extends StatelessWidget {
  const LoginSubmitButtom({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([emailController, passwordController]),
      builder: (context, child) {
        final hasEmail = emailController.text.trim().isNotEmpty;
        final hasPassword = passwordController.text.trim().length >= 12;
        final canEnableButtom = hasEmail && hasPassword;
        return MainButtomWidget(
          title: AppConstans.login,
          onPressed: canEnableButtom
              ? () {
                  if (formKey.currentState!.validate()) {
                    log("Success Entry Field");
                  }
                }
              : null,
        );
      },
    );
  }
}
