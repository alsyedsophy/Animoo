import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:animoo/features/auth/signup/widgets/password_strength_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PasswordSection extends StatelessWidget {
  const PasswordSection({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.validatePassword,
    required this.validateConfirmPassword,
    required this.isPasswordStrong,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? Function(String?)? validatePassword;
  final String? Function(String?)? validateConfirmPassword;
  final bool Function(String) isPasswordStrong;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(16.h),
        CustomAlignWidget(title: AppConstans.password),
        Gap(6.h),
        CustomTextFormField(
          controller: passwordController,
          hinitText: AppConstans.hinitPasswordText,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: validatePassword,
        ),
        Gap(8.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: passwordController,
          builder: (context, value, child) {
            return PasswordStrengthChecker(
              password: value.text,
              isStrong: isPasswordStrong(value.text),
            );
          },
        ),
        Gap(16.h),
        CustomAlignWidget(title: AppConstans.confirmPassword),
        Gap(6.h),
        CustomTextFormField(
          controller: confirmPasswordController,
          hinitText: AppConstans.hinitConfirmPasswordText,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: validateConfirmPassword,
        ),
      ],
    );
  }
}
