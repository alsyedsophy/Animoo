import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TitleAndDescForgetPass extends StatelessWidget {
  const TitleAndDescForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(17.h),
        Text(
          AppConstans.forgetPasswordText,
          style: AppTextStyle.backOrForgetOrOTPStyle,
        ),
        Gap(6.h),
        RichText(
          text: TextSpan(
            text: AppConstans.enterYourEmailToCheckText,
            style: AppTextStyle.textUnderForgetOrOTPStyle,
          ),
        ),
      ],
    );
  }
}
