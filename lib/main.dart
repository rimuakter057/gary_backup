import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/dependency/dependency_injection.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/light_theme.dart' as AppTheme;



void main() {
  runApp(const TradersConnect());
}

class TradersConnect extends StatelessWidget {
  const TradersConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: DependencyInjection(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          // Set initial route
          initialRoute: AppRoutes.splashScreen,
          // Connect routes
          getPages: AppRoutes.routes,
        );
      },

    );
  }
}
