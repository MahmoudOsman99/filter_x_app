import 'package:filter_x/core/shared_widgets/error_screen.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/presentation/screens/device_details.dart';
import 'package:flutter/material.dart';

import '../../features/device/presentation/screens/device_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.signinRoute:
      //   return MaterialPageRoute(builder: (context) => SigninScreen());
      case AppRoutes.deviceRoute:
        return MaterialPageRoute(builder: (context) => DeviceScreen());

      case AppRoutes.singleDeviceRoute:
        return MaterialPageRoute(
            builder: (context) => DeviceDetails(
                  device: settings.arguments as DeviceEntity,
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
