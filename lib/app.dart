import 'package:filter_x/features/device/presentation/bloc/device_bloc.dart';
import 'package:filter_x/features/device/presentation/bloc/device_event.dart';
import 'package:filter_x/features/employees/presentation/bloc/employees_event.dart';
import 'package:filter_x/features/installments/presentation/bloc/installments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/themes/light_theme.dart';
import 'core/router_settings/app_router.dart';
import 'core/router_settings/routes.dart';
import 'features/employees/presentation/bloc/employees_bloc.dart';
import 'features/installments/data/models/installment_model.dart';
import 'injection_container.dart' as di;

class FilterX extends StatelessWidget {
  const FilterX({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bloc for device
        BlocProvider(
          create: (context) => di.sl<DeviceBloc>()..add(GetAllDeviceEvent()),
        ),

        // Bloc for Employees
        BlocProvider(
          create: (context) =>
              di.sl<EmployeessBloc>()..add(GetAllEmployeesEvent()),
        ),

        // Bloc for installments
        BlocProvider(
          create: (context) => di.sl<InstallmentsBloc>()
            ..add(GetAllInstallmentsEvent())
            ..add(AddInstallmentEvent(installment: null))
            ..add(GetAllInstallmentsEvent()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRoutes.installmentsRoute,
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
