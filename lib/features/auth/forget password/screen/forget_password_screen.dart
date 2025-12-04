import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:animoo/features/auth/forget%20password/widgets/title_and_desc_forget_pass.dart';
import 'package:animoo/widgets/app_bar_custom_widget.dart';
import 'package:animoo/features/auth/forget%20password/widgets/forget_submit_button.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  String? _validaEmail(String? value) {
    if (value == null || value.isEmpty) return "This Field Shouldn't be Empty";
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
      return "Please enter a valid email";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarCustomWidget(text: AppConstans.backText),
                TitleAndDescForgetPass(),
                Gap(58.h),
                Text(
                  AppConstans.email,
                  style: AppTextStyle.labelTextFieldStyle,
                ),
                Gap(6.h),
                CustomTextFormField(
                  controller: emailController,
                  hinitText: AppConstans.hinitEmailText,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validaEmail,
                ),
                Gap(151.h),
                ForgetSubmitButton(
                  emailController: emailController,
                  formKey: formKey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
