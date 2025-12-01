import 'package:animoo/core/constants/app_assets.dart';
import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_text_size.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle logoFontStyle = TextStyle(
    fontFamily: AppAssetsFonts.fontOriginalSurfer,
    fontSize: AppTextSize.s_12,
    color: AppColors.primaryColor,
  );

  static TextStyle loginOrSignupFontStyle = TextStyle(
    fontFamily: AppAssetsFonts.fontOtamaEp,
    fontSize: AppTextSize.s_38,
    color: AppColors.blackColor,
  );

  static TextStyle labelTextFieldStyle = TextStyle(
    fontSize: AppTextSize.s_16,
    color: AppColors.grayColor,
  );

  static TextStyle hinitTextFieldStyle = TextStyle(
    fontSize: AppTextSize.s_12,
    color: AppColors.greyHinitTextColor,
  );

  static TextStyle textMainButtomStyle = TextStyle(
    fontSize: AppTextSize.s_14,
    color: AppColors.whiteColor,
  );
  static TextStyle forgetPasswordTextButtomStyle = TextStyle(
    fontSize: AppTextSize.s_10,
    color: AppColors.primaryColor,
    decoration: TextDecoration.underline,
  );
  static TextStyle askHaveAcountStyle = TextStyle(
    fontSize: AppTextSize.s_14,
    color: AppColors.grayColor,
  );
  static TextStyle signupNowStyle = TextStyle(
    fontSize: AppTextSize.s_14,
    color: AppColors.primaryColor,
  );
}
