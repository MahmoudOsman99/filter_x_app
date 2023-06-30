import 'package:flutter/material.dart';
import 'config/themes/light_theme.dart';
import 'core/router_settings/app_router.dart';
import 'core/router_settings/routes.dart';

class FilterX extends StatelessWidget {
  const FilterX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.deviceRoute,
      theme: lightTheme,
    );
  }
}
