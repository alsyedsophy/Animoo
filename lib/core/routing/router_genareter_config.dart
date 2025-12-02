import 'package:animoo/core/routing/app_routs.dart';
import 'package:animoo/features/auth/login/screen/login_screen.dart';
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
    ],
  );
}
