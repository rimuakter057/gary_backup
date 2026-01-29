
import 'package:gary_goodger/features/analyzer/presentation/screens/analyzer_details_screen.dart';
import 'package:gary_goodger/features/analyzer/presentation/screens/analyzer_heat_map_screen.dart';
import 'package:gary_goodger/features/analyzer/presentation/screens/analyzer_screen.dart';
import 'package:gary_goodger/features/auth/presentation/screens/auth_flow_screen.dart';
import 'package:gary_goodger/features/common/presentation/screens/graph_chart_screen.dart';
import 'package:gary_goodger/features/compare/presentation/screens/compare_screens.dart';
import 'package:gary_goodger/features/copier/presentation/screens/copier_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/add_account_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/equity_protector_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/home.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/tranding_symbol_screen.dart';
import 'package:gary_goodger/features/sentiments/presentation/screens/sentiments_screen.dart';

import 'package:gary_goodger/features/splash/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';

///=========================App Routes=========================

class AppRoutes {
  static const String splashScreen = "/onBoarding";
   static const String authFlowScreen = "/authFlow";
  static const String accountScreen = "/accountScreen";
  static const String copierScreen = "/copierScreen";
  static const String analyzerScreen = "/analyzerScreen";
  static const String analyzerDetailsScreen = "/analyzerDetailsScreen";
  static const String analyzerHeatMapScreen = "/analyzerHeatMapScreen";
  static const String compareScreen = "/compareScreen";
  static const String sentimentsScreen="/sentimentsScreen";
  static const String graphChartScreen="/graphChartScreen";
  static const String homeScreen="/homeScreen";
  static const String equityProtectorScreen='/equityProtectorScreen';
  static const String tradingSymbolScreen='/tradingSymbolScreen';
  static const String addAccountScreen='/addAccountScreen';

  static List<GetPage> routes = [
    ///===========================Authentication==========================

    GetPage(name: splashScreen, page: ()=>SplashScreen()),

    GetPage(name: splashScreen, page: ()=>AuthFlowScreen()),

    GetPage(name: accountScreen, page: ()=>AccountScreen()),
    GetPage(name: copierScreen, page: ()=>CopierScreen()),
    GetPage(name: analyzerScreen, page: ()=>AnalyzerScreen()),
    GetPage(name: analyzerDetailsScreen, page: ()=>AnalyzerDetailsScreen()),
    GetPage(name: analyzerHeatMapScreen, page: ()=>AnalyzerHeatmapScreen()),
    GetPage(name: compareScreen, page: ()=>ComparePropScreen()),
    GetPage(name: sentimentsScreen, page: ()=>SentimentsScreen()),
    GetPage(name: graphChartScreen, page: ()=>GraphChartScreen()),
    GetPage(name: homeScreen, page: ()=>HomeDashboard()),
    GetPage(name: equityProtectorScreen, page: ()=>EquityProtectorScreen()),
    GetPage(name: tradingSymbolScreen, page: ()=>TradingSymbolScreen()),
    GetPage(name: addAccountScreen, page: ()=>AddAccountScreen()),

  ];
}
