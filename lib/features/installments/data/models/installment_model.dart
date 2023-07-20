import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_x/core/shared/my_converter.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';

class InstallmentModel extends Installment {
  const InstallmentModel({
    required super.ID,
    required super.client,
    required super.product,
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
    required super.employee,
    required super.technician,
  });
  factory InstallmentModel.fromJson(
      {required Map<String, dynamic> installmentJson,
      String? idFromCloudFireStore}) {
    return InstallmentModel(
      ID: idFromCloudFireStore ?? installmentJson['id'],
      client: installmentJson['clientID'],
      product: installmentJson['productID'],
      dateContract: MyConverter.convertFromTimestampToDateTime(
          installmentJson['dateContract'] as Timestamp),
      totalPrice: installmentJson['totalPrice'],
      remaining: installmentJson['remaining'],
      paid: installmentJson['paid'],
      numberOfMonths: installmentJson['numberOfMonths'],
      monthlyMoney: installmentJson['monthlyMoney'],
      remainingToFinish: installmentJson['remainingToFinish'],
      notes: installmentJson['notes'],
      trustReciept: installmentJson['trustReciept'],
      isActive: installmentJson['isActive'],
      technician: installmentJson['technicianID'],
      employee: installmentJson['employeeID'],
    );
  }

  static Map<String, dynamic> toJson(InstallmentModel install) {
    return {
      'clientID': install.client.ID,
      'productID': install.product.ID,
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
      'technicianID': install.technician.id,
      'employeeID': install.employee.id,
    };
  }
}
