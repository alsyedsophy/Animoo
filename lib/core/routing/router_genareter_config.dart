import 'package:animoo/core/routing/app_routs.dart';
import 'package:animoo/features/auth/create%20new%20password/screen/create_new_password_screen.dart';
import 'package:animoo/features/auth/forget%20password/screen/forget_password_screen.dart';
import 'package:animoo/features/auth/login/screen/login_screen.dart';
import 'package:animoo/features/auth/otp%20verification/screen/otp_verification_screen.dart';
import 'package:animoo/features/auth/signup/screen/signup_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenareterConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouts.loginScreen,
    routes: [
      GoRoute(
        name: AppRouts.loginScreen,
        path: AppRouts.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRouts.signupScreen,
        name: AppRouts.signupScreen,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: AppRouts.forgetPassword,
        name: AppRouts.forgetPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRouts.otpVerification,
        name: AppRouts.otpVerification,
        builder: (context, state) => OtpVerificationScreen(),
      ),
      GoRoute(
        path: AppRouts.createNewPassword,
        name: AppRouts.createNewPassword,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
    ],
  );
}
