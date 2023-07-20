import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';
import 'package:filter_x/features/installments/domain/repositories/installments_repository.dart';

class GetAllInstallmentsUsecase {
  final InstallmentsRepository installmentsRepository;
  GetAllInstallmentsUsecase({required this.installmentsRepository});

  Future<Either<Failure, List<Installment>>> call() {
    return installmentsRepository.getAllInstallments();
  }
}
