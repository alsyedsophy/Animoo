import 'dart:developer';

import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/routing/app_routs.dart';
import 'package:animoo/widgets/main_buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetSubmitButton extends StatelessWidget {
  const ForgetSubmitButton({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: emailController,
      builder: (context, child) {
        final hasEmail = emailController.text.trim().isNotEmpty;
        return MainButtomWidget(
          title: AppConstans.sendCodeText,
          onPressed: hasEmail
              ? () {
                  if (formKey.currentState!.validate()) {
                    log("Success Field");
                    context.pushNamed(AppRouts.otpVerification);
                  }
                }
              : null,
        );
      },
    );
  }
}
