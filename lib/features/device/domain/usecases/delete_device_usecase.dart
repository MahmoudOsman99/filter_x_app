import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/domain/repositories/device_repository.dart';

class DeleteDeviceUseCase {
  final DeviceRepository deviceRepository;

  DeleteDeviceUseCase(this.deviceRepository);

  Future<Either<Failure, Unit>> call(String deviceId) async {
    return await deviceRepository.deleteDevice(deviceId);
  }
}
