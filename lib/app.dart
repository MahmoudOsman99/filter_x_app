import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:filter_x/features/device/presentation/bloc/device_bloc.dart';
import 'package:filter_x/features/device/presentation/bloc/device_event.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:filter_x/features/employees/employee_positions.dart';
import 'package:filter_x/features/employees/presentation/bloc/employees_event.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';
import 'package:filter_x/features/installments/presentation/bloc/installments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/themes/light_theme.dart';
import 'core/router_settings/app_router.dart';
import 'core/router_settings/routes.dart';
import 'features/employees/presentation/bloc/employees_bloc.dart';
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
          // ..add(AddProductEvent())
        ),

        // Bloc for Employees
        BlocProvider(
          create: (context) => di.sl<EmployeessBloc>()
            // ..add(AddEmployeeEvent(
            //     employee: Employee(
            //   name: 'Osman',
            //   nationalID: '29905260400479',
            //   address: 'Suez',
            //   phone: '01000249042',
            //   phone2: '01000249042',
            //   dateOfHiring: DateTime.now(),
            //   isActive: true,
            //   position: EmployeePositions.owner.index,
            //   salary: 4000,
            // )))
            ..add(GetAllEmployeesEvent()),
        ),

        // Bloc for installments
        BlocProvider(
          create: (context) => di.sl<InstallmentsBloc>()
            // ..add(AddInstallmentEvent(
            //   installment: Installment(
            //     clientID: 'OcauJcjZzsesitxAPzkK',
            //     productID: 'ITyPDMTc9izk9OZrFBeu',
            //     totalPrice: 300,
            //     paid: 300,
            //     remaining: 2700,
            //     numberOfMonths: 10,
            //     monthlyMoney: 270,
            //     notes: 'dfdfdgrgre747notes',
            //     isActive: true,
            //     dateContract: DateTime.now(),
            //     remainingToFinish: 2000,
            //     trustReciept: false,
            //     employeeID: '3yvIifgAY28u1Q7AhfNo',
            //     technicianID: '3yvIifgAY28u1Q7AhfNo',
            //   ),
            // ))
            ..add(GetAllInstallmentsEvent()),
        ),

        // Bloc for clients
        BlocProvider(
            create: (context) => di.sl<ClientsBloc>()
              // ..add(GetOneClientByIdEvent(clientId: 'sd'))
              ..add(AddClientEvent(
                  client: Client(
                cardNumber: 1,
                name: 'name',
                address: 'address',
                phone: 'phone',
                phone2: 'phone2',
                devices: const ['1', '2'],
                dateOfContract: DateTime.now(),
                indoor: true,
                isInstallment: false,
                governorateID: 'sUn5hVM9WzBVQdz0r3kS',
                isActiveToTechnicalVisits: true,
                technicianID: '3yvIifgAY28u1Q7AhfNo',
                employeeID: '3yvIifgAY28u1Q7AhfNo',
                notes: 'nopsjfoiewjnufienwugfbewbhyfehybfewuyfwf',
              )))),
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
