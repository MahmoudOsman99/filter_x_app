import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installments/domain/repositories/installments_repository.dart';

class DeleteInstallmentUsecase {
  final InstallmentsRepository installmentsRepository;
  DeleteInstallmentUsecase({required this.installmentsRepository});

  Future<Either<Failure, Unit>> call(String installmentID) {
    return installmentsRepository.deleteInstallment(installmentID);
  }
}
