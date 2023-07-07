import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';

abstract class DeviceRepository {
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices();
  Future<Either<Failure, Unit>> addDevice(DeviceEntity device);
  Future<Either<Failure, Unit>> updateDevice(DeviceEntity device);
  Future<Either<Failure, Unit>> deleteDevice(String deviceId);
}
