import 'package:animoo/core/routing/router_genareter_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimooApp extends StatelessWidget {
  const AnimooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterGenareterConfig.goRouter,
      ),
    );
  }
}
