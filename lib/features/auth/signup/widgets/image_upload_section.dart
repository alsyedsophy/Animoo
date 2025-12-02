import 'package:animoo/core/constants/app_assets.dart';
import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_constans.dart';
import 'package:animoo/core/constants/app_size.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ImageUploadSection extends StatelessWidget {
  const ImageUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.h_200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.r_10),
        border: Border.all(
          color: AppColors.primaryColor,
          // style: BorderStyle.none,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssetsImage.gallaryIcon),
            Gap(16.h),
            TextButton(
              onPressed: () {},
              child: Text(
                AppConstans.selectFile,
                style: AppTextStyle.selectFileStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
