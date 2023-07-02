import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "EG"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale(
          "ar",
          "EG",
        ) // OR Locale('ar', 'AE') OR Other RTL locales,
        );
  }
}
