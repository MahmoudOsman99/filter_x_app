import 'package:filter_x/core/shared_widgets/error_screen.dart';
import 'package:filter_x/features/clients/presentation/screens/clients_screen.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/presentation/screens/product_details_screen.dart';
import 'package:filter_x/features/installments/presentation/screens/installments_list_screen.dart';
import 'package:flutter/material.dart';

import '../../features/device/presentation/screens/product_screen.dart';
import '../../features/employees/presentation/screens/employee_profile_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.signinRoute:
      //   return MaterialPageRoute(builder: (context) => SigninScreen());
      case AppRoutes.productRoute:
        return MaterialPageRoute(builder: (context) => DeviceScreen());
      case AppRoutes.installmentsRoute:
        return MaterialPageRoute(
            builder: (context) => const InstallmentsScreen());

      case AppRoutes.employeesRoute:
        return MaterialPageRoute(
            builder: (context) => const EmployeeProfileScreen());

      // case AppRoutes.employeeRoute:
      //   return MaterialPageRoute(builder: (context) => EmployeeProfileScreen());

      case AppRoutes.productSingleRoute:
        return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  product: settings.arguments as Product,
                ));
      case AppRoutes.clientsRoute:
        return MaterialPageRoute(builder: (context) => const ClientsScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
