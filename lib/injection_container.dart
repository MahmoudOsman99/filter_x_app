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
      () => DeviceRemoteDataSourceWithFirebase());

  sl.registerLazySingleton<DeviceLocalDataSource>(
      () => DeviceLocalDataSourceImplSharedPref(sharedPref: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoWithConnectionCheckerImpl(sl()));

  //! External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPref);
  sl.registerLazySingleton(() => InternetConnection());
}
