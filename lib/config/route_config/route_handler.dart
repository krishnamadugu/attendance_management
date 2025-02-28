import 'package:attendance_management/src/feat/others/no_network_screen/presentation/screen/no_connectivity_screen.dart';
import 'package:flutter/material.dart';

import '../../src/feat/bottom_bar/presentation/screen/bottom_bar_screen.dart';
import '../../src/feat/others/error_screen/presentation/screen/error_screen.dart';
import '../../src/feat/others/splash_screen/presentation/screen/splash_screen.dart';
import 'route_names.dart';

class RouteHandler {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    var routeName = routeSettings.name;

    switch (routeName) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (splashContext) => SplashScreen(),
        );
      case RouteNames.bottomBarScreen:
        return MaterialPageRoute(
          builder: (homeContext) => BottomBarScreen(),
        );
      case RouteNames.errorScreen:
        return MaterialPageRoute(
          builder: (homeContext) => ErrorScreen(),
        );
      case RouteNames.noConnectivityScreen:
        return MaterialPageRoute(
          builder: (homeContext) => NoInternetScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (errorContext) => ErrorScreen(),
        );
    }
  }
}
