import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:animoo/widgets/custom_align_widget.dart';
import 'package:animoo/widgets/custom_text_form_field.dart';
import 'package:animoo/widgets/logo_app_and_title.dart';
import 'package:animoo/widgets/main_buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
                CustomTextFormField(
                  controller: emailController,
                  hinitText: AppConstans.hinitEmailText,
                ),
                Gap(16.h),
                CustomAlignWidget(title: AppConstans.password),
                Gap(6.h),
                CustomTextFormField(
                  controller: passwordController,
                  hinitText: AppConstans.hinitPasswordText,
                  obscureText: true,
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
                MainButtomWidget(title: AppConstans.login),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppConstans.askHaveAcountText,
                        style: AppTextStyle.askHaveAcountStyle,
                      ),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            AppConstans.signupNowText,
                            style: AppTextStyle.signupNowStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
