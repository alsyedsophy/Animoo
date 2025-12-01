import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:animoo/widgets/logo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LogoAppAndTitle extends StatelessWidget {
  const LogoAppAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoApp(),
        Gap(4.6.h),
        Text(AppConstans.appLogoName, style: AppTextStyle.logoFontStyle),
      ],
    );
  }
}
