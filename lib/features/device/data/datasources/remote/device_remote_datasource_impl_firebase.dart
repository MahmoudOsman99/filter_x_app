import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/device/data/datasources/remote/device_remote_datasource.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';

import '../../models/device_model.dart';

class DeviceRemoteDataSourceWithFirebase extends DeviceRemoteDataSource {
  final db = FirebaseFirestore.instance;
  final NetworkInfo networkInfo;

  DeviceRemoteDataSourceWithFirebase({required this.networkInfo});

  @override
  Future<Unit> addDevice(DeviceEntity device) {
    // TODO: implement deleteDevice
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteDevice(String deviceId) async {
    if (await networkInfo.hasConnection) {
      db
          .collection(CollectionsNames.deviceCollectionFirebaseNameText)
          .doc(deviceId)
          .delete()
          .then((value) {
        print(AppStrings.deletedSuccessfullysaveTextArabic);
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }
    return Future.value(unit);
  }

  @override
  Future<List<DeviceModel>> getAllDevices() async {
    final devicesFromFirebase = await db.collection('device').get();
    final List<DeviceModel> devices = [];
    if (devicesFromFirebase.docs.isNotEmpty) {
      // devicesFromFirebase.docs.map((device) => devices.add(
      //       DeviceModel.fromJson(
      //         idFromCloudFireStore: device.id,
      //         json: device.data(),
      //       ),
      //     ));
      for (int i = 0; i < devicesFromFirebase.docs.length; i++) {
        devices.add(
          DeviceModel.fromJson(
            idFromCloudFireStore: devicesFromFirebase.docs[i].id,
            json: devicesFromFirebase.docs[i].data(),
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
  Future<Unit> updateDevice(DeviceEntity device) {
    // TODO: implement updateDevice
    throw UnimplementedError();
  }
}
