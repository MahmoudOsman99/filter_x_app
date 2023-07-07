import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/device/data/datasources/local/device_local_datasource.dart';
import 'package:filter_x/features/device/data/datasources/remote/device_remote_datasource.dart';
import 'package:filter_x/features/device/data/datasources/remote/device_remote_datasource_impl_firebase.dart';
import 'package:filter_x/features/device/data/models/device_model.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  final DeviceRemoteDataSource deviceRemoteDataSource;
  final NetworkInfo networkInfo;
  final DeviceLocalDataSource deviceLocalDataSource;

  DeviceRepositoryImpl({
    required this.deviceRemoteDataSource,
    required this.networkInfo,
    required this.deviceLocalDataSource,
  });

  @override
  Future<Either<Failure, List<DeviceModel>>> getAllDevices() async {
    if (await networkInfo.isConnected) {
      try {
        final devices = await deviceRemoteDataSource.getAllDevices();
        deviceLocalDataSource.cacheDevices(devices);
        return Right(devices);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<DeviceModel> devices =
            await deviceLocalDataSource.getAllDevices;
        return Right(devices);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addDevice(DeviceEntity device) {
    // TODO: implement addDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteDevice(String deviceId) {
    // TODO: implement deleteDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateDevice(DeviceEntity device) {
    // TODO: implement updateDevice
    throw UnimplementedError();
  }
}
