import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/device/data/datasources/local/device_local_datasource.dart';
import 'package:filter_x/features/device/data/datasources/remote/device_remote_datasource.dart';
import 'package:filter_x/features/device/data/datasources/remote/device_remote_datasource_impl_firebase.dart';
import 'package:filter_x/features/device/data/repositories/device_repository_impl.dart';
import 'package:filter_x/features/device/domain/repositories/device_repository.dart';
import 'package:filter_x/features/device/domain/usecases/add_device_usecase.dart';
import 'package:filter_x/features/device/domain/usecases/delete_device_usecase.dart';
import 'package:filter_x/features/device/domain/usecases/get_all_devices_usecase.dart';
import 'package:filter_x/features/device/presentation/bloc/device_bloc.dart';
import 'package:filter_x/features/employees/data/datasources/local/employee_local_datasource.dart';
import 'package:filter_x/features/employees/data/datasources/remote/employees_remote_datasource.dart';
import 'package:filter_x/features/employees/data/datasources/remote/employees_remote_datasource_impl_firebase.dart';
import 'package:filter_x/features/employees/data/repositories/employee_repository_impl.dart';
import 'package:filter_x/features/employees/domain/repositories/employees_repository.dart';
import 'package:filter_x/features/employees/domain/usecases/add_employee_usecase.dart';
import 'package:filter_x/features/employees/domain/usecases/get_all_employee_usecase.dart';
import 'package:filter_x/features/employees/presentation/bloc/bloc.dart';
import 'package:filter_x/features/installments/data/datasources/remote/installment_remote_datasource_firebase.dart';
import 'package:filter_x/features/installments/data/datasources/remote/installments_remote_datasource.dart';
import 'package:filter_x/features/installments/data/repositories/installments_repository_impl.dart';
import 'package:filter_x/features/installments/domain/repositories/installments_repository.dart';
import 'package:filter_x/features/installments/domain/usecases/add_installment_usecase.dart';
import 'package:filter_x/features/installments/domain/usecases/delete_installment.dart';
import 'package:filter_x/features/installments/domain/usecases/get_all_installments.dart';
import 'package:filter_x/features/installments/domain/usecases/update_installment_usecase.dart';
import 'package:filter_x/features/installments/presentation/bloc/installments_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Devices
  // Bloc
  sl.registerFactory(() => DeviceBloc(
        addDeviceUsecase: sl(),
        deleteDeviceUsecase: sl(),
        getAllDevicesUsecase: sl(),
      ));

  //UseCases
  sl.registerLazySingleton(() => AddDeviceUseCase(sl()));
  sl.registerLazySingleton(() => GetAllDevicesUseCase(sl()));
  sl.registerLazySingleton(() => DeleteDeviceUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<DeviceRepository>(() => DeviceRepositoryImpl(
      deviceRemoteDataSource: sl(),
      networkInfo: sl(),
      deviceLocalDataSource: sl()));

  // DataSources
  sl.registerLazySingleton<DeviceRemoteDataSource>(
      () => DeviceRemoteDataSourceWithFirebase(networkInfo: sl()));

  sl.registerLazySingleton<DeviceLocalDataSource>(
      () => DeviceLocalDataSourceImplSharedPref(sharedPref: sl()));

  //! Features - Employees
  // Bloc
  sl.registerFactory(() => EmployeessBloc(
        getAllEmployeesUseCase: sl(),
        addEmployeeUsecase: sl(),
      ));

  //UseCases

  sl.registerLazySingleton(() => GetAllEmployeesUsecase(sl()));
  sl.registerLazySingleton(() => AddEmployeeUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeesRepositoryImpl(
        employeeRemoteDatasource: sl(),
        employeeLocalDatasource: sl(),
        networkInfo: sl(),
      ));

  // DataSources
  sl.registerLazySingleton<EmployeesRemoteDatasource>(
      () => EmployeesRemoteDatasourceImplFirebase(networkInfo: sl()));

  sl.registerLazySingleton<EmployeeLocalDataSource>(
      () => EmployeeLocalDataSourceImpl(sharedPref: sl()));

  //! Features - Installments
  // Bloc
  sl.registerFactory(() => InstallmentsBloc(
        addInstallmentUsecase: sl(),
        deleteInstallmentUsecase: sl(),
        getAllInstallmentsUsecase: sl(),
        updateInstallmentUsecase: sl(),
      ));

  //UseCases

  sl.registerLazySingleton(
      () => GetAllInstallmentsUsecase(installmentsRepository: sl()));
  sl.registerLazySingleton(
      () => AddInstallmentUsecase(installmentsRepository: sl()));
  sl.registerLazySingleton(
      () => UpdateInstallmentUsecase(installmentsRepository: sl()));
  sl.registerLazySingleton(
      () => DeleteInstallmentUsecase(installmentsRepository: sl()));

  // Repositories
  sl.registerLazySingleton<InstallmentsRepository>(
      () => InstallmentsRepositoryImpl(
            installmentsRemoteDataSource: sl(),
            networkInfo: sl(),
          ));

  // DataSources
  sl.registerLazySingleton<InstallmentsRemoteDataSource>(
      () => InstallmentsRemoteDataSourceImplByFirebase(networkInfo: sl()));

  // sl.registerLazySingleton<InstallmentsRemoteDataSource>(
  //     () => InstallmentsLocalDataSource(sharedPref: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoWithConnectionCheckerImpl(sl()));

  //! External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPref);
  sl.registerLazySingleton(() => InternetConnection());
}
