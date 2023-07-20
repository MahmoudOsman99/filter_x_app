import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/device/data/datasources/local/device_local_datasource.dart';
import 'package:filter_x/features/device/data/datasources/remote/product_remote_datasource.dart';
import 'package:filter_x/features/device/data/datasources/remote/product_remote_datasource_impl_firebase.dart';
import 'package:filter_x/features/device/data/models/product_model.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;
  final ProductLocalDataSource productLocalDataSource;

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.networkInfo,
    required this.productLocalDataSource,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.hasConnection) {
      try {
        final products = await productRemoteDataSource.getAllProducts();
        if (products.isNotEmpty) {
          productLocalDataSource.cacheDevices(products);
        }
        return Right(products);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<ProductModel> devices =
            await productLocalDataSource.getAllDevices;
        return Right(devices);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addProduct(Product product) async {
    if (await networkInfo.hasConnection) {
      return Right(await productRemoteDataSource.addProduct(ProductModel(
        ID: product.ID,
        name: product.name,
        NOS: product.NOS,
        hasWarranty: product.hasWarranty,
        NOWIfExistInMonth: product.NOWIfExistInMonth,
        productCount: product.productCount,
      )));
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String deviceId) {
    // TODO: implement deleteDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(Product device) {
    // TODO: implement updateDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> getOneProductById(String productId) async {
    if (await networkInfo.hasConnection) {
      return Right(await productRemoteDataSource.getOneProductById(productId));
    } else {
      throw OfflineException();
    }
  }
}
