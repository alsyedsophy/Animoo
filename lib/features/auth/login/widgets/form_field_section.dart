import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FormFieldSection extends StatelessWidget {
  const FormFieldSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.validateEmail,
    required this.validatePassword,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String?)? validateEmail;
  final String? Function(String?)? validatePassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hinitText: AppConstans.hinitEmailText,
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
        ),
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
      ],
    );
  }
}
