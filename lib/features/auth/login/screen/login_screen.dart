import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:animoo/core/routing/app_routs.dart';
import 'package:animoo/features/auth/login/widgets/form_field_section.dart';
import 'package:animoo/features/auth/login/widgets/login_submit_buttom.dart';
import 'package:animoo/features/auth/login/widgets/buttom_nav_bar_widget.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/logo_app_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Validator عام للحقول غير الخاصة
  String? _validateRequiredField(String? value, {String? customMessage}) {
    if (value == null || value.trim().isEmpty) {
      return customMessage ?? "This field shouldn't be empty";
    }
    return null;
  }

  // التححق من صحة الايميل
  String? _validateEmail(String? value) {
    final requiredError = _validateRequiredField(value);
    if (requiredError != null) {
      requiredError;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return "Please enter a valid email";
    }
    return null;
  }

  // التحقق من كلمة المرور
  String? _validatePassword(String? value) {
    final requiredError = _validateRequiredField(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value!.length < 12) {
      return "Password must be at least 12 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoAppAndTitle(),
                Gap(9.4.h),
                Text(
                  AppConstans.login,
                  style: AppTextStyle.loginOrSignupFontStyle,
                ),
                CustomAlignWidget(title: AppConstans.email),
                Gap(6.h),
                FormFieldSection(
                  emailController: emailController,
                  passwordController: passwordController,
                  validateEmail: _validateEmail,
                  validatePassword: _validatePassword,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppConstans.forgetPasswordText,
                      style: AppTextStyle.forgetPasswordTextButtomStyle,
                    ),
                  ),
                ),
                Gap(31.h),
                LoginSubmitButtom(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                ),
                Spacer(),
                ButtomNavBarWidget(
                  text: AppConstans.askDoNotHaveAcountText,
                  buttomText: AppConstans.signupNowText,
                  onTap: () => context.pushNamed(AppRouts.signupScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
