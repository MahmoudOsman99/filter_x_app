import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/domain/repositories/product_repository.dart';

class AddDeviceUseCase {
  final ProductRepository deviceRepository;

  AddDeviceUseCase(this.deviceRepository);

  Future<Either<Failure, Unit>> call(Product device) async {
    return await deviceRepository.addProduct(device);
  }
}
