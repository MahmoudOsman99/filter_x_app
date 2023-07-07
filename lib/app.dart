import 'package:filter_x/features/device/presentation/bloc/device_bloc.dart';
import 'package:filter_x/features/device/presentation/bloc/device_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/themes/light_theme.dart';
import 'core/router_settings/app_router.dart';
import 'core/router_settings/routes.dart';
import 'injection_container.dart' as di;

class FilterX extends StatelessWidget {
  const FilterX({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<DeviceBloc>()..add(GetAllDeviceEvent()),
      child: MaterialApp(
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
          ),
    );
  }
}
