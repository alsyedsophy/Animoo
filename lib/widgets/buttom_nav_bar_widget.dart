import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class ButtomNavBarWidget extends StatelessWidget {
  const ButtomNavBarWidget({
    super.key,
    required this.text,
    required this.buttomText,
    this.onTap,
  });

  final String text;
  final String buttomText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: text, style: AppTextStyle.askHaveAcountStyle),
          WidgetSpan(
            child: InkWell(
              onTap: onTap,
              child: Text(buttomText, style: AppTextStyle.signupNowStyle),
            ),
          ),
        ],
      ),
    );
  }
}
