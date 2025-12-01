import 'package:animoo/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssetsImage.logoApp, width: 70.w);
  }
}
