import '../../domain/entities/device_entity.dart';

// ignore: must_be_immutable
class DeviceModel extends DeviceEntity {
  @override
  DeviceModel({
    required ID,
    required String name,
    required int NOS,
    required bool hasWarranty,
    required int NOWIfExistInMonth,
  }) : super(
          ID: ID,
          NOS: NOS,
          hasWarranty: hasWarranty,
          name: name,
          NOWIfExistInMonth: NOWIfExistInMonth,
        );

  factory DeviceModel.fromJson(
      {String? idFromCloudFireStore, required Map<String, dynamic> json}) {
    return DeviceModel(
      ID: idFromCloudFireStore,
      name: json['name'],
      NOS: json['NOS'],
      hasWarranty: json['hasWarranty'],
      NOWIfExistInMonth: json['NOWIfExistInMonth'],
    );
  }

  Map<String, dynamic> toJson(DeviceModel device) {
    return {
      'ID': device.ID,
      'name': device.name,
      'NOS': device.NOS,
      'hasWarranty': device.hasWarranty,
      'NOWIfExistInMonth': device.NOWIfExistInMonth,
    };
  }
}
