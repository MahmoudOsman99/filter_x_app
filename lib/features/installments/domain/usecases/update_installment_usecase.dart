import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';
import 'package:filter_x/features/installments/domain/repositories/installments_repository.dart';

class UpdateInstallmentUsecase {
  final InstallmentsRepository installmentsRepository;
  UpdateInstallmentUsecase({required this.installmentsRepository});

  Future<Either<Failure, Unit>> call(Installment installment) {
    return installmentsRepository.updateInstallment(installment);
  }
}
