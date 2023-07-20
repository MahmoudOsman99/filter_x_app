import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/domain/repositories/product_repository.dart';

class DeleteDeviceUseCase {
  final ProductRepository deviceRepository;

  DeleteDeviceUseCase(this.deviceRepository);

  Future<Either<Failure, Unit>> call(String deviceId) async {
    return await deviceRepository.deleteProduct(deviceId);
  }
}
