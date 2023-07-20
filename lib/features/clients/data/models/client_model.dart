import 'package:filter_x/core/shared/my_converter.dart';

import '../../domain/entities/client.entity.dart';

class ClientModel extends Client {
  ClientModel({
    String? id,
    required int cardNumber,
    required String name,
    required String address,
    required String phone,
    required String phone2,
    required List<String> devices,
    required DateTime dateOfContract,
    required bool indoor,
    required bool isInstallment,
    required String governorateID,
    required bool isActiveToTechnicalVisits,
    required String technicianID,
    required String employeeID,
    required String notes,
  }) : super(
          ID: id,
          cardNumber: cardNumber,
          name: name,
          address: address,
          phone: phone,
          phone2: phone2,
          devices: devices,
          dateOfContract: dateOfContract,
          indoor: indoor,
          isInstallment: isInstallment,
          governorateID: governorateID,
          isActiveToTechnicalVisits: isActiveToTechnicalVisits,
          technicianID: technicianID,
          employeeID: employeeID,
          notes: notes,
        );

  factory ClientModel.fromJson(
      {String? idFromCloudFireStore, required Map<String, dynamic> json}) {
    return ClientModel(
      id: idFromCloudFireStore ?? json['id'] as String,
      cardNumber: json['cardNumber'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      phone2: json['phone2'] as String,
      devices:
          (json['devices'] as List<dynamic>).map((e) => e as String).toList(),
      dateOfContract:
          MyConverter.convertFromTimestampToDateTime(json['dateOfContract']),
      indoor: json['indoor'] as bool,
      isInstallment: json['isInstallment'] as bool,
      governorateID: json['governorateID'] as String,
      isActiveToTechnicalVisits: json['isActiveToTechnicalVisits'] as bool,
      technicianID: json['technicianID'] as String,
      employeeID: json['employeeID'] as String,
      notes: json['notes'] as String,
    );
  }

  static Map<String, dynamic> toJson(ClientModel client) {
    return {
      'cardNumber': client.cardNumber,
      'name': client.name,
      'address': client.address,
      'phone': client.phone,
      'phone2': client.phone2,
      'devices': client.devices,
      'dateOfContract': client.dateOfContract,
      'indoor': client.indoor,
      'isInstallment': client.isInstallment,
      'governorateID': client.governorateID,
      'isActiveToTechnicalVisits': client.isActiveToTechnicalVisits,
      'technicianID': client.technicianID,
      'employeeID': client.employeeID,
      'notes': client.notes,
    };
  }
}
