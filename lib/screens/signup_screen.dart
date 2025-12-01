import 'dart:developer';

import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:animoo/widgets/buttom_nav_bar_widget.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:animoo/widgets/logo_app_and_title.dart';
import 'package:animoo/widgets/main_buttom_widget.dart';
import 'package:animoo/widgets/password_strength_checker.dart';
import 'package:animoo/widgets/select_file_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void _disposeControllers() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // دالة فحص قوة كلمة المرور
  bool _isPasswordStrong(String password) {
    return password.length >= 12 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  // Validator عام للحقول غير الخاصة
  String? _validateRequiredField(String? value, {String? customMessage}) {
    if (value == null || value.trim().isEmpty) {
      return customMessage ?? "This field shouldn't be empty";
    }
    return null;
  }

  // Validator للإيميل مع RegExp
  String? _validateEmail(String? value) {
    final requiredError = _validateRequiredField(value);
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  // Validator للأسماء مع فحص طول
  String? _validateName(String? value) {
    final requiredError = _validateRequiredField(value);
    if (requiredError != null) return requiredError;

    if (value!.trim().length < 2) {
      return "Name must be at least 2 characters";
    }
    return null;
  }

  // Validator للهاتف (11 رقم مصري، مع RegExp)
  String? _validatePhone(String? value) {
    final requiredError = _validateRequiredField(
      value,
      customMessage: "Please enter your phone number",
    );
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^01[0152][0-9]{8}$').hasMatch(value!)) {
      return "Phone number must be 11 digits starting with 01";
    }
    return null;
  }

  // Validator لكلمة المرور (طول أدنى)
  String? _validatePassword(String? value) {
    final requiredError = _validateRequiredField(value);
    if (requiredError != null) return requiredError;

    if (value!.trim().length < 12) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  // Validator لتأكيد كلمة المرور
  String? _validateConfirmPassword(String? value) {
    final requiredError = _validateRequiredField(
      value,
      customMessage: "Please confirm your password",
    );
    if (requiredError != null) return requiredError;

    if (value!.trim() != passwordController.text.trim()) {
      return "Passwords don't match";
    }
    return null;
  }

  // بناء قسم الحقول العامة
  Widget _buildPersonalFields() {
    return Column(
      children: [
        CustomAlignWidget(title: AppConstans.firstName),
        Gap(6.h),
        CustomTextFormField(
          controller: firstNameController,
          hinitText: AppConstans.hinitFirstNameText,
          keyboardType: TextInputType.name,
          validator: _validateName,
        ),
        CustomAlignWidget(title: AppConstans.lastName),
        Gap(6.h),
        CustomTextFormField(
          controller: lastNameController,
          hinitText: AppConstans.hinitLastNameText,
          keyboardType: TextInputType.name,
          validator: _validateName,
        ),
        CustomAlignWidget(title: AppConstans.email),
        Gap(6.h),
        CustomTextFormField(
          controller: emailController,
          hinitText: AppConstans.hinitEmailText,
          keyboardType: TextInputType.emailAddress,
          validator: _validateEmail,
        ),
        CustomAlignWidget(title: AppConstans.phone),
        Gap(6.h),
        CustomTextFormField(
          controller: phoneController,
          hinitText: AppConstans.hinitPhoneText,
          keyboardType: TextInputType.phone,
          validator: _validatePhone,
        ),
      ],
    );
  }

  // بناء قسم كلمة المرور
  Widget _buildPasswordSection() {
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
          validator: _validatePassword,
        ),
        Gap(8.h),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: passwordController,
          builder: (context, value, child) {
            return PasswordStrengthChecker(
              password: value.text,
              isStrong: _isPasswordStrong(value.text),
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
          validator: _validateConfirmPassword,
        ),
      ],
    );
  }

  // بناء الزر مع التحقق الديناميكي
  // بناء الزر مع التحقق الديناميكي (مصحح)
  Widget _buildSubmitButton() {
    return AnimatedBuilder(
      animation: Listenable.merge([
        firstNameController, // أضف مراقبة لجميع الحقول لفحص شامل
        lastNameController,
        emailController,
        phoneController,
        passwordController,
        confirmPasswordController,
      ]),
      builder: (context, child) {
        // فحص يدوي بسيط لتعطيل الزر (بدون validate() في build)
        final hasFirstName =
            firstNameController.text.trim().isNotEmpty &&
            firstNameController.text.trim().length >= 2;
        final hasLastName =
            lastNameController.text.trim().isNotEmpty &&
            lastNameController.text.trim().length >= 2;
        final hasEmail =
            emailController.text.trim().isNotEmpty &&
            RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            ).hasMatch(emailController.text.trim());
        final hasPhone = phoneController.text.trim().length == 11;
        final isStrong = _isPasswordStrong(passwordController.text.trim());
        final isConfirmed =
            passwordController.text.trim() ==
            confirmPasswordController.text.trim();
        final hasConfirmPassword = confirmPasswordController.text
            .trim()
            .isNotEmpty;
        final canSubmit =
            hasFirstName &&
            hasLastName &&
            hasEmail &&
            hasPhone &&
            isStrong &&
            isConfirmed &&
            hasConfirmPassword;

        return MainButtomWidget(
          title: AppConstans.signUp,
          onPressed: canSubmit
              ? () {
                  // validate() هنا فقط، عند الضغط (آمن تمامًا، ويُظهر الأخطاء إن وُجدت)
                  if (formKey.currentState!.validate()) {
                    log("Success Entry Fields");
                  }
                }
              : null, // تعطيل إذا لم تُحقق الشروط
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LogoAppAndTitle(),
                  Gap(9.4.h),
                  Text(
                    AppConstans.signUp,
                    style: AppTextStyle.loginOrSignupFontStyle,
                  ),
                  _buildPersonalFields(),
                  _buildPasswordSection(),
                  Gap(16.h),
                  CustomAlignWidget(title: AppConstans.uploadImageFile),
                  Gap(8.h),
                  const SelectFileContainer(),
                  Gap(31.h),
                  _buildSubmitButton(),
                  Gap(6.h),
                  ButtomNavBarWidget(
                    text: AppConstans.askHaveAcountText,
                    buttomText: AppConstans.login,
                    onTap: () => context.pop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
