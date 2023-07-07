import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/domain/repositories/device_repository.dart';

class AddDeviceUseCase {
  final DeviceRepository deviceRepository;

  AddDeviceUseCase(this.deviceRepository);

  Future<Either<Failure, Unit>> call(DeviceEntity device) async {
    return await deviceRepository.addDevice(device);
  }
}
