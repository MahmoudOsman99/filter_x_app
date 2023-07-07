import 'package:dartz/dartz.dart';
import 'package:filter_x/features/device/data/models/device_model.dart';

abstract class DeviceRemoteDataSource {
  Future<List<DeviceModel>> getAllDevices();
  Future<Unit> addDevice(DeviceModel device);
  Future<Unit> updateDevice(DeviceModel device);
  Future<Unit> deleteDevice(String id);
}
