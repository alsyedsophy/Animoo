import 'package:animoo/core/constants/app_colors.dart';
import 'package:animoo/core/constants/app_size.dart';
import 'package:animoo/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinitText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String hinitText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final ValueNotifier<bool> _obscureNotifire;

  @override
  void initState() {
    _obscureNotifire = ValueNotifier(widget.obscureText);
    super.initState();
  }

  @override
  void dispose() {
    _obscureNotifire.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureNotifire,
      builder: (context, obscureValue, child) {
        return SizedBox(
          height: AppSize.h_44,
          child: TextFormField(
            controller: widget.controller,
            cursorColor: AppColors.primaryColor,
            cursorErrorColor: AppColors.redColor,
            obscureText: obscureValue,
            keyboardType: widget.keyboardType,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            validator: widget.validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.lightGrayColor,
              suffixIcon: widget.obscureText
                  ? ValueListenableBuilder(
                      valueListenable: _obscureNotifire,
                      builder: (context, obscureValue, child) {
                        return IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureNotifire.value = !_obscureNotifire.value;
                            });
                          },
                          icon: Icon(
                            obscureValue
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        );
                      },
                    )
                  : null,
              label: Text(
                widget.hinitText,
                style: AppTextStyle.hinitTextFieldStyle,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.r_10),
                borderSide: BorderSide(color: AppColors.lightGrayColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.r_10),
                borderSide: BorderSide(color: AppColors.lightGrayColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.r_10),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.r_10),
                borderSide: BorderSide(color: AppColors.redColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
