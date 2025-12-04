import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:animoo/features/auth/create%20new%20password/widgets/create_submit_button.dart';
import 'package:animoo/features/auth/create%20new%20password/widgets/create_password_section.dart';
import 'package:animoo/widgets/app_bar_custom_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _isPasswordStrong(String password) {
    return password.length >= 12 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password must be Field";
    if (value.trim().length < 12) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return "Confirm Password must be Field";
    if (value.trim() != passController.text) {
      return "Password must be matched";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustomWidget(text: AppConstans.cancelText),
              Text(
                AppConstans.createNewPasswordText,
                style: AppTextStyle.backOrForgetOrOTPStyle,
              ),
              Gap(10.h),
              Form(
                key: formKey,
                child: CreatePasswordSection(
                  passController: passController,
                  confirmPassController: confirmPassController,
                  validatePassword: _validatePassword,
                  validateConfirmPassword: _validateConfirmPassword,
                  isStrong: _isPasswordStrong,
                ),
              ),
              CreateSubmitButton(
                passController: passController,
                confirmPassController: confirmPassController,
                formKey: formKey,
                isPasswordStrong: _isPasswordStrong,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
