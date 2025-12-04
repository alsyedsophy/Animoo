import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios_new,
            size: 17.sp,

            color: AppColors.primaryColor,
          ),
          Gap(2.w),
          Text(text, style: AppTextStyle.backOrForgetOrOTPStyle),
          Gap(17.h),
        ],
      ),
    );
  }
}
