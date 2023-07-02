import 'package:dartz/dartz.dart';
import 'package:filter_x/core/failures/failures.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';

// typedef Either<List<DeviceEntity>, Failure>  listOrFailure

abstract class DeviceRemoteDataSource {
  Future<Either<List<DeviceEntity>, Failure>> getAllDevices();
}
