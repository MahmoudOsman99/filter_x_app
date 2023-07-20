import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/features/device/data/models/product_model.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> get getAllDevices;
  Future<Unit> cacheDevices(List<ProductModel> devices);
}

const String cachedDevices = 'cachedDevices';

class DeviceLocalDataSourceImplSharedPref implements ProductLocalDataSource {
  final SharedPreferences sharedPref;

  DeviceLocalDataSourceImplSharedPref({required this.sharedPref});

  @override
  Future<Unit> cacheDevices(List<ProductModel> devices) {
    List devicesToJson = devices
        .map<Map<String, dynamic>>((device) => ProductModel.toJson(device))
        .toList();
    sharedPref.setString(cachedDevices, json.encode(devicesToJson));
    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> get getAllDevices async {
    final jsonString = sharedPref.getString(cachedDevices);

    if (jsonString != null) {
      List decodedJsonFromString = json.decode(jsonString);

      return Future.value(decodedJsonFromString
          .map<ProductModel>((device) => ProductModel.fromJson(product: device))
          .toList());

      // final List<DeviceModel> devicesList = decodedJsonFromString
      //     .map<DeviceModel>((device) => DeviceModel.fromJson(json: device))
      //     .toList();
    } else {
      throw EmptyCacheException();
    }
  }
}
