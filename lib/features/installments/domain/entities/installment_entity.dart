import 'package:equatable/equatable.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

class Installment extends Equatable {
  final String? ID;
  final Client client;
  final Product product;
  final double totalPrice;
  final double paid;
  final double remaining;
  final int numberOfMonths;
  final double monthlyMoney;
  final String notes;
  final bool isActive;
  final DateTime dateContract;
  final double remainingToFinish;
  final bool trustReciept;
  final Employee employee;
  final Employee technician;

  const Installment({
    this.ID,
    required this.client,
    required this.product,
    required this.totalPrice,
    required this.paid,
    required this.remaining,
    required this.numberOfMonths,
    required this.monthlyMoney,
    required this.notes,
    required this.isActive,
    required this.dateContract,
    required this.remainingToFinish,
    required this.trustReciept,
    required this.employee,
    required this.technician,
  });

  @override
  List<Object?> get props => [
        ID,
        client,
        product,
        totalPrice,
        paid,
        remaining,
        numberOfMonths,
        monthlyMoney,
        notes,
        isActive,
        dateContract,
        remainingToFinish,
        trustReciept,
        employee,
        technician,
      ];
}
