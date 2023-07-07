import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/features/device/data/models/device_model.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DeviceLocalDataSource {
  Future<List<DeviceModel>> get getAllDevices;
  Future<Unit> cacheDevices(List<DeviceModel> devices);
}

const String cachedDevices = 'cachedDevices';

class DeviceLocalDataSourceImplSharedPref implements DeviceLocalDataSource {
  final SharedPreferences sharedPref;

  DeviceLocalDataSourceImplSharedPref({required this.sharedPref});

  @override
  Future<Unit> cacheDevices(List<DeviceModel> devices) {
    List devicesToJson = devices
        .map<Map<String, dynamic>>((device) => DeviceModel.toJson(device))
        .toList();
    sharedPref.setString(cachedDevices, json.encode(devicesToJson));
    return Future.value(unit);
  }

  @override
  Future<List<DeviceModel>> get getAllDevices async {
    final jsonString = sharedPref.getString(cachedDevices);

    if (jsonString != null) {
      List decodedJsonFromString = json.decode(jsonString);

      return Future.value(decodedJsonFromString
          .map<DeviceModel>((device) => DeviceModel.fromJson(json: device))
          .toList());

      // final List<DeviceModel> devicesList = decodedJsonFromString
      //     .map<DeviceModel>((device) => DeviceModel.fromJson(json: device))
      //     .toList();
    } else {
      throw EmptyCacheException();
    }
  }
}
