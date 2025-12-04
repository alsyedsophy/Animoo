import 'package:animoo/core/constants/app_assets.dart';
import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_size.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle logoFontStyle = TextStyle(
    fontFamily: AppAssetsFonts.fontOriginalSurfer,
    fontSize: AppSize.s_12,
    color: AppColors.primaryColor,
  );

  static TextStyle loginOrSignupFontStyle = TextStyle(
    fontFamily: AppAssetsFonts.fontOtamaEp,
    fontSize: AppSize.s_38,
    color: AppColors.blackColor,
  );

  static TextStyle labelTextFieldStyle = TextStyle(
    fontSize: AppSize.s_16,
    color: AppColors.grayColor,
  );

  static TextStyle hinitTextFieldStyle = TextStyle(
    fontSize: AppSize.s_12,
    color: AppColors.greyHinitTextColor,
  );

  static TextStyle textMainButtomStyle = TextStyle(
    fontSize: AppSize.s_14,
    color: AppColors.whiteColor,
  );
  static TextStyle forgetPasswordTextButtomStyle = TextStyle(
    fontSize: AppSize.s_10,
    color: AppColors.primaryColor,
    decoration: TextDecoration.underline,
  );
  static TextStyle askHaveAcountStyle = TextStyle(
    fontSize: AppSize.s_14,
    color: AppColors.grayColor,
  );
  static TextStyle signupNowStyle = TextStyle(
    fontSize: AppSize.s_14,
    color: AppColors.primaryColor,
  );
  static TextStyle selectFileStyle = TextStyle(
    fontSize: AppSize.s_16,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle passwordStreghtStyle({required Color color}) => TextStyle(
    fontSize: AppSize.s_10,
    color: color,
    fontWeight: FontWeight.w600,
  );

  static TextStyle backOrForgetOrOTPStyle = TextStyle(
    fontFamily: AppAssetsFonts.fontOtamaEp,
    fontSize: AppSize.s_18,
    color: AppColors.primaryColor,
  );
  static TextStyle textUnderForgetOrOTPStyle = TextStyle(
    fontSize: AppSize.s_14,
    color: AppColors.grayColor,
    fontWeight: FontWeight.w400,
  );
}
