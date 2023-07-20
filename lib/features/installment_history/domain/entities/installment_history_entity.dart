import 'package:equatable/equatable.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';

class InstallmentHistory extends Equatable {
  final String? ID;
  final Client client;
  final Product product;
  final Installment installment;
  final DateTime lastVisitDate;
  final double lastPaid;
  final String notes;
  final DateTime nextVisitDate;
  final double remainingToFinish;
  final Employee employee;
  final Employee technician;

  const InstallmentHistory({
    this.ID,
    required this.client,
    required this.product,
    required this.installment,
    required this.lastPaid,
    required this.notes,
    required this.lastVisitDate,
    required this.nextVisitDate,
    required this.remainingToFinish,
    required this.employee,
    required this.technician,
  });

  @override
  List<Object?> get props => [
        client,
        product,
        installment,
        lastPaid,
        notes,
        lastVisitDate,
        nextVisitDate,
        remainingToFinish,
        employee,
        technician,
      ];
}
