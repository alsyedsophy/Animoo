import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/features/auth/signup/widgets/password_strength_checker.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreatePasswordSection extends StatelessWidget {
  const CreatePasswordSection({
    super.key,
    required this.passController,
    required this.confirmPassController,
    required this.validatePassword,
    required this.validateConfirmPassword,
    required this.isStrong,
  });
  final TextEditingController passController;
  final TextEditingController confirmPassController;
  final String? Function(String?)? validatePassword;
  final String? Function(String?)? validateConfirmPassword;
  final bool Function(String) isStrong;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAlignWidget(title: AppConstans.newPasswordText),
        Gap(6.h),
        CustomTextFormField(
          controller: passController,
          hinitText: AppConstans.hinitPasswordText,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: validatePassword,
        ),
        Gap(8.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: passController,
          builder: (context, value, child) {
            return PasswordStrengthChecker(
              password: passController.text.trim(),
              isStrong: isStrong(passController.text),
            );
          },
        ),
        Gap(16.h),
        CustomAlignWidget(title: AppConstans.confirmPassword),
        Gap(6.h),
        CustomTextFormField(
          controller: confirmPassController,
          hinitText: AppConstans.hinitConfirmPasswordText,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: validateConfirmPassword,
        ),
        Gap(82.h),
      ],
    );
  }
}
