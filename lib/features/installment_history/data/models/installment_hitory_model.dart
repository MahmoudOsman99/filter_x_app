import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_x/core/shared/my_converter.dart';
import 'package:filter_x/features/installment_history/domain/entities/installment_history_entity.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';

class InstallmentHistoryModel extends InstallmentHistory {
  const InstallmentHistoryModel({
    required super.ID,
    required super.installment,
    required super.client,
    required super.product,
    required super.lastPaid,
    required super.remainingToFinish,
    required super.lastVisitDate,
    required super.nextVisitDate,
    required super.notes,
    required super.employee,
    required super.technician,
  });
  factory InstallmentHistoryModel.fromJson(
      {required Map<String, dynamic> installmentHistoryJson,
      String? idFromCloudFireStore}) {
    return InstallmentHistoryModel(
      ID: idFromCloudFireStore ?? installmentHistoryJson['id'],
      installment: installmentHistoryJson['installmentID'],
      client: installmentHistoryJson['clientID'],
      product: installmentHistoryJson['productID'],
      lastVisitDate: MyConverter.convertFromTimestampToDateTime(
          installmentHistoryJson['lastVisitDate'] as Timestamp),
      lastPaid: installmentHistoryJson['lastPaid'],
      nextVisitDate: MyConverter.convertFromTimestampToDateTime(
          installmentHistoryJson['nextVisitDate'] as Timestamp),
      remainingToFinish: installmentHistoryJson['remainingToFinish'],
      notes: installmentHistoryJson['notes'],
      technician: installmentHistoryJson['technicianID'],
      employee: installmentHistoryJson['employeeID'],
    );
  }

  static Map<String, dynamic> toJson(InstallmentHistoryModel installHistory) {
    return {
      'installmentID': installHistory.installment,
      'clientID': installHistory.client,
      'productID': installHistory.product,
      'lastVisitDate': installHistory.lastVisitDate,
      'lastPaid': installHistory.lastPaid,
      'nextVisitDate': installHistory.nextVisitDate,
      'remainingToFinish': installHistory.remainingToFinish,
      'notes': installHistory.notes,
      'technicianID': installHistory.technician,
      'employeeID': installHistory.employee,
    };
  }
}
