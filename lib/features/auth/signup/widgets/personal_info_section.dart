import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.emailController,
    required this.validateName,
    required this.validateEmail,
    required this.validatePhone,
  });

  final TextEditingController firstNameController;

  final TextEditingController lastNameController;

  final TextEditingController phoneController;

  final TextEditingController emailController;
  final String? Function(String?)? validateName;
  final String? Function(String?)? validateEmail;
  final String? Function(String?)? validatePhone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAlignWidget(title: AppConstans.firstName),
        Gap(6.h),
        CustomTextFormField(
          controller: firstNameController,
          hinitText: AppConstans.hinitFirstNameText,
          keyboardType: TextInputType.name,
          validator: validateName,
        ),
        CustomAlignWidget(title: AppConstans.lastName),
        Gap(6.h),
        CustomTextFormField(
          controller: lastNameController,
          hinitText: AppConstans.hinitLastNameText,
          keyboardType: TextInputType.name,
          validator: validateName,
        ),
        CustomAlignWidget(title: AppConstans.email),
        Gap(6.h),
        CustomTextFormField(
          controller: emailController,
          hinitText: AppConstans.hinitEmailText,
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
        ),
        CustomAlignWidget(title: AppConstans.phone),
        Gap(6.h),
        CustomTextFormField(
          controller: phoneController,
          hinitText: AppConstans.hinitPhoneText,
          keyboardType: TextInputType.phone,
          validator: validatePhone,
        ),
      ],
    );
  }
}
