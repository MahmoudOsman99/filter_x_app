import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final String? ID;
  final int cardNumber;
  final String name;
  final String address;
  final String phone;
  final String phone2;
  final List<String> devices;
  final DateTime dateOfContract;
  final bool indoor;
  final bool isInstallment;
  final String governorateID;
  final bool isActiveToTechnicalVisits;
  final String technicianID;
  final String employeeID;
  final String notes;

  Client({
    this.ID,
    required this.cardNumber,
    required this.name,
    required this.address,
    required this.phone,
    required this.phone2,
    required this.devices,
    required this.dateOfContract,
    required this.indoor,
    required this.isInstallment,
    required this.governorateID,
    required this.isActiveToTechnicalVisits,
    required this.technicianID,
    required this.employeeID,
    required this.notes,
  });

  @override
  List<Object?> get props => [
        ID,
        cardNumber,
        name,
        address,
        phone,
        phone2,
        devices,
        dateOfContract,
        indoor,
        isInstallment,
        governorateID,
        isActiveToTechnicalVisits,
        technicianID,
        employeeID,
        notes,
      ];
}
