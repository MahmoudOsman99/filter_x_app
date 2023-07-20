import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';

abstract class InstallmentsRepository {
  Future<Either<Failure, List<Installment>>> getAllInstallments();
  Future<Either<Failure, Unit>> addInstallment(Installment installment);
  Future<Either<Failure, Unit>> updateInstallment(Installment installment);
  Future<Either<Failure, Unit>> deleteInstallment(String installmentID);
}
