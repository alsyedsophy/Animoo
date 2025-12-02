import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAlignWidget extends StatelessWidget {
  const CustomAlignWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(title, style: AppTextStyle.labelTextFieldStyle),
    );
  }
}
