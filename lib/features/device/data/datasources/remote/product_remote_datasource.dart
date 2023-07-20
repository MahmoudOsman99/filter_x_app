import 'package:dartz/dartz.dart';
import 'package:filter_x/features/device/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<Unit> addProduct(ProductModel product);
  Future<Unit> updateProduct(ProductModel product);
  Future<Unit> deleteProduct(String id);
  Future<ProductModel> getOneProductById(String productId);
}
