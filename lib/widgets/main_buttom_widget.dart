import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtomWidget extends StatelessWidget {
  const MainButtomWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(title, style: AppTextStyle.textMainButtomStyle),
      ),
    );
  }
}
