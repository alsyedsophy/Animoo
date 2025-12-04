import 'package:animoo/core/constants/app_constans.dart';

import 'package:animoo/features/auth/otp%20verification/widgets/otp_submit_button.dart';
import 'package:animoo/features/auth/otp%20verification/widgets/pin_code_field_section.dart';
import 'package:animoo/features/auth/otp%20verification/widgets/title_and_desc_otp.dart';
import 'package:animoo/widgets/app_bar_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late final TextEditingController _optController;
  late final GlobalKey<FormState> formKey;

  // int _secondsRemaining = 60;
  // bool _canResent = false;
  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    _optController = TextEditingController();
    formKey = GlobalKey<FormState>();
    // _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _optController.dispose();
    // _timer?.cancel();
  }

  // void _startTimer() {
  //   _canResent = false;
  //   _secondsRemaining = 60;
  //   _timer?.cancel();
  //   _timer = Timer.periodic(Duration(seconds: 60), (timer) {
  //     setState(() {
  //       if (_secondsRemaining > 0) {
  //         _secondsRemaining--;
  //       } else {
  //         _canResent = true;
  //         _timer?.cancel();
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustomWidget(text: AppConstans.cancelText),
              TitleAndDescOtp(),
              Gap(54.h),
              Form(
                key: formKey,
                child: PinCodeFieldSection(optController: _optController),
              ),
              Gap(41.h),
              OtpSubmitButton(optController: _optController, formKey: formKey),
              Gap(6.h),
              Align(
                alignment: Alignment.center,
                child: Text(AppConstans.resendCodeText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
