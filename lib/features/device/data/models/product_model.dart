import '../../domain/entities/product_entity.dart';

// ignore: must_be_immutable
class ProductModel extends Product {
  @override
  ProductModel({
    required ID,
    required String name,
    required int NOS,
    required bool hasWarranty,
    required int NOWIfExistInMonth,
    required int productCount,
  }) : super(
          ID: ID,
          NOS: NOS,
          hasWarranty: hasWarranty,
          name: name,
          NOWIfExistInMonth: NOWIfExistInMonth,
          productCount: productCount,
        );

  factory ProductModel.fromJson(
      {String? idFromCloudFireStore, required Map<String, dynamic> product}) {
    return ProductModel(
      ID: idFromCloudFireStore ?? '1',
      name: product['name'],
      NOS: product['NOS'],
      hasWarranty: product['hasWarranty'],
      NOWIfExistInMonth: product['NOWIfExistInMonth'],
      productCount: product['productCount'] ?? 0,
    );
  }

  static Map<String, dynamic> toJson(Product product) {
    return {
      'ID': product.ID,
      'name': product.name,
      'NOS': product.NOS,
      'hasWarranty': product.hasWarranty,
      'NOWIfExistInMonth': product.NOWIfExistInMonth,
      'productCount': product.productCount,
    };
  }
}
