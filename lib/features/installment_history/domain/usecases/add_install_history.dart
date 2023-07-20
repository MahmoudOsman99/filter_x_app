import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installment_history/domain/entities/installment_history_entity.dart';
import 'package:filter_x/features/installment_history/domain/repositories/installment_history_repository.dart';

class AddInstallHistoryUseCase {
  final InstallmentHistoryRepository repo;

  AddInstallHistoryUseCase({required this.repo});

  Future<Either<Failure, Unit>> call(InstallmentHistory installHistory) {
    return repo.addInstallHistory(installHistory);
  }
}
