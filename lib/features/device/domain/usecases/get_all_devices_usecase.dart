import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/domain/repositories/device_repository.dart';

class GetAllDevicesUseCase {
  final DeviceRepository deviceRepository;

  GetAllDevicesUseCase(this.deviceRepository);

  Future<Either<Failure, List<DeviceEntity>>> call() async {
    return await deviceRepository.getAllDevices();
  }
}
