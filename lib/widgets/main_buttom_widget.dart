import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_size.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class MainButtomWidget extends StatelessWidget {
  const MainButtomWidget({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.h_44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r_10),
          ),
        ),
        child: Text(title, style: AppTextStyle.textMainButtomStyle),
      ),
    );
  }
}
