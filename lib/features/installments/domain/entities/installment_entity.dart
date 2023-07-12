import 'package:equatable/equatable.dart';

class Installment extends Equatable {
  final String ID;
  final String clientID;
  final String productID;
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
  final String employeeID;
  final String technicianID;

  const Installment({
    required this.ID,
    required this.clientID,
    required this.productID,
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
    required this.employeeID,
    required this.technicianID,
  });

  @override
  List<Object?> get props => [
        ID,
        clientID,
        productID,
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
        employeeID,
        technicianID,
      ];
}
