
import 'package:gary_goodger/features/auth/presentation/screens/auth_flow_screen.dart';
import 'package:gary_goodger/features/home/presentation/screens/home_screen.dart';
import 'package:gary_goodger/features/splash/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';

///=========================App Routes=========================

class AppRoutes {
  static const String splashScreen = "/onBoarding";
   static const String authFlowScreen = "/authFlow";
  static const String homeScreen = "/homeScreen";

  static List<GetPage> routes = [
    ///===========================Authentication==========================

    GetPage(name: splashScreen, page: ()=>SplashScreen()),

    GetPage(name: splashScreen, page: ()=>AuthFlowScreen()),

    GetPage(name: homeScreen, page: ()=>HomeScreen()),

  ];
}
