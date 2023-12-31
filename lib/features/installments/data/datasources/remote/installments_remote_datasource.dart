import 'package:dartz/dartz.dart';
import 'package:filter_x/features/installments/data/models/installment_model.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';

abstract class InstallmentsRemoteDataSource {
  Future<List<InstallmentModel>> getAllInstallments();
  Future<Unit> addInstallment(InstallmentModel installmentModel);
  Future<Unit> updateInstallment(InstallmentModel installmentModel);
  Future<Unit> deleteAllInstallment(String installmentID);
}
