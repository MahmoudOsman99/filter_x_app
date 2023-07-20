import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/device/data/datasources/remote/product_remote_datasource.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';

import '../../models/product_model.dart';

class DeviceRemoteDataSourceWithFirebase extends ProductRemoteDataSource {
  final db = FirebaseFirestore.instance;

  DeviceRemoteDataSourceWithFirebase();

  @override
  Future<Unit> addProduct(Product device) {
    db.collection(CollectionsNames.productsCollectionFirebaseNameText).add(
          ProductModel.toJson(
            ProductModel(
              ID: device.ID,
              name: device.name,
              NOS: device.NOS,
              hasWarranty: device.hasWarranty,
              NOWIfExistInMonth: device.NOWIfExistInMonth,
              productCount: device.productCount,
            ),
          ),
        );
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteProduct(String deviceId) async {
    db
        .collection(CollectionsNames.productsCollectionFirebaseNameText)
        .doc(deviceId)
        .delete()
        .then((value) {
      print(AppStrings.deletedSuccessfullysaveTextArabic);
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final devicesFromFirebase = await db
        .collection(CollectionsNames.productsCollectionFirebaseNameText)
        .get();
    final List<ProductModel> devices = [];
    if (devicesFromFirebase.docs.isNotEmpty) {
      // devicesFromFirebase.docs.map((device) => devices.add(
      //       DeviceModel.fromJson(
      //         idFromCloudFireStore: device.id,
      //         json: device.data(),
      //       ),
      //     ));
      for (int i = 0; i < devicesFromFirebase.docs.length; i++) {
        devices.add(
          ProductModel.fromJson(
            idFromCloudFireStore: devicesFromFirebase.docs[i].id,
            product: devicesFromFirebase.docs[i].data(),
          ),
        );
      }
      return devices;
    }
    throw ServerException();
    // for (var i = 0; i < devicesFromFirebase.docs.length; i++) {
    //   // devices.add(
    //   DeviceModel.fromJson(
    //     idFromCloudFireStore: devicesFromFirebase.docs[i].id,
    //     json: devicesFromFirebase.docs[i].data(),
    //   );
    // );
  }

  @override
  Future<Unit> updateProduct(Product device) {
    // TODO: implement updateDevice
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getOneProductById(String productId) async {
    final product = await db
        .collection(CollectionsNames.productsCollectionFirebaseNameText)
        .doc(productId)
        .get();
    if (product.data() != null) {
      return ProductModel.fromJson(product: product.data()!);
    }
    throw ServerException();
  }
}
