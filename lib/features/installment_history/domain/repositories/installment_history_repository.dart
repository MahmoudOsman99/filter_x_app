import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installment_history/domain/entities/installment_history_entity.dart';

abstract class InstallmentHistoryRepository {
  Future<Either<Failure, Unit>> addInstallHistory(
      InstallmentHistory installmentHistory);
}
