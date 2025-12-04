import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TitleAndDescOtp extends StatelessWidget {
  const TitleAndDescOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(17.h),
        Text(
          AppConstans.oTPVerficationText,
          style: AppTextStyle.backOrForgetOrOTPStyle,
        ),
        Gap(6.h),
        RichText(
          text: TextSpan(
            text: AppConstans.enter6NumberOTPText,
            style: AppTextStyle.textUnderForgetOrOTPStyle,
          ),
        ),
      ],
    );
  }
}
