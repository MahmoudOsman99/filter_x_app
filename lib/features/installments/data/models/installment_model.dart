import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';

class InstallmentModel extends Installment {
  const InstallmentModel({
    required super.ID,
    required super.clientID,
    required super.productID,
    required super.totalPrice,
    required super.paid,
    required super.remaining,
    required super.numberOfMonths,
    required super.monthlyMoney,
    required super.notes,
    required super.isActive,
    required super.dateContract,
    required super.remainingToFinish,
    required super.trustReciept,
    required super.employeeID,
    required super.technicianID,
  });
  factory InstallmentModel.fromJson(Map<String, dynamic> installmentJson) {
    return InstallmentModel(
      ID: installmentJson['id'],
      clientID: installmentJson['clientID'],
      productID: installmentJson['productID'],
      dateContract: installmentJson['dateContract'],
      totalPrice: installmentJson['totalPrice'],
      remaining: installmentJson['remaining'],
      paid: installmentJson['paid'],
      numberOfMonths: installmentJson['numberOfMonths'],
      monthlyMoney: installmentJson['monthlyMoney'],
      remainingToFinish: installmentJson['remainingToFinish'],
      notes: installmentJson['notes'],
      trustReciept: installmentJson['trustReciept'],
      isActive: installmentJson['isActive'],
      technicianID: installmentJson['technicianID'],
      employeeID: installmentJson['employeeID'],
    );
  }

  static Map<String, dynamic> toJson(InstallmentModel install) {
    return {
      'clientID': install.clientID,
      'productID': install.productID,
      'dateContract': install.dateContract,
      'totalPrice': install.totalPrice,
      'paid': install.paid,
      'numberOfMonths': install.numberOfMonths,
      'monthlyMoney': install.monthlyMoney,
      'trustReciept': install.trustReciept,
      'remaining': install.remaining,
      'isActive': install.isActive,
      'notes': install.notes,
      'remainingToFinish': install.remainingToFinish,
      'technicianID': install.technicianID,
      'employeeID': install.employeeID,
    };
  }
}
