import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/domain/repositories/product_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';

class GetOneProductByIdUsecase {
  final ProductRepository productRepository;

  const GetOneProductByIdUsecase({required this.productRepository});

  Future<Either<Failure, Product>> call(String productId) async {
    return await productRepository.getOneProductById(productId);
  }
}
