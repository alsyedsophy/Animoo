import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinitText,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hinitText;
  final bool obscureText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      cursorErrorColor: AppColors.redColor,
      obscureText: _obscureText,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrayColor,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        label: Text(widget.hinitText, style: AppTextStyle.hinitTextFieldStyle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.lightGrayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.redColor),
        ),
      ),
    );
  }
}
