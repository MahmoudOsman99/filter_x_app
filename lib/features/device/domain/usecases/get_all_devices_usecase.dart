import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/domain/repositories/product_repository.dart';

class GetAllDevicesUseCase {
  final ProductRepository deviceRepository;

  GetAllDevicesUseCase(this.deviceRepository);

  Future<Either<Failure, List<Product>>> call() async {
    return await deviceRepository.getAllProducts();
  }
}
