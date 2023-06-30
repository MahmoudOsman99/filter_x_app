import 'package:flutter/material.dart';

import '../../features/device/presentation/screens/device_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.deviceRoute:
      default:
        return MaterialPageRoute(builder: (context) => DeviceScreen());
      // case AppRoutes.signinRoute:
      //   return MaterialPageRoute(builder: (context) => SigninScreen());
      // case AppRoutes.homeRoute:
      // default:
      //   return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
