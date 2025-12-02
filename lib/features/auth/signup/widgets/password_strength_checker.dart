import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_size.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PasswordStrengthChecker extends StatelessWidget {
  const PasswordStrengthChecker({
    super.key,
    required this.password,
    required this.isStrong,
  });

  final String password;
  final bool isStrong;

  bool get hasMinLength => password.length >= 12;
  bool get hasUpperCase => password.contains(RegExp(r'[A-Z]'));
  bool get hasLowerCase => password.contains(RegExp(r'[a-z]'));
  bool get hasNumber => password.contains(RegExp(r'[0-9]'));
  bool get hasSpecialChar =>
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              AppConstans.passwordStrengthCheckerText,
              style: AppTextStyle.passwordStreghtStyle(
                color: isStrong ? AppColors.greenColor : AppColors.redColor,
              ),
            ),
          ),
          _buildRule(isValed: hasMinLength, text: AppConstans.passLengthText),
          _buildRule(isValed: hasUpperCase, text: AppConstans.passUpperText),
          _buildRule(isValed: hasLowerCase, text: AppConstans.passLowerText),
          _buildRule(isValed: hasNumber, text: AppConstans.passOneNumberText),
          _buildRule(
            isValed: hasSpecialChar,
            text: AppConstans.passOneSpecialCharText,
          ),
        ],
      ),
    );
  }

  Widget _buildRule({required bool isValed, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isValed ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            size: AppSize.s_14,
            color: isValed ? AppColors.greenColor : AppColors.redColor,
          ),
          Gap(6.w),
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.passwordStreghtStyle(
                color: isValed ? AppColors.greenColor : AppColors.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
