import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/features/installments/data/models/installment_model.dart';
import 'package:filter_x/features/installments/domain/repositories/installments_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/installment_entity.dart';
import '../datasources/remote/installments_remote_datasource.dart';

class InstallmentsRepositoryImpl extends InstallmentsRepository {
  final InstallmentsRemoteDataSource installmentsRemoteDataSource;
  final NetworkInfo networkInfo;

  InstallmentsRepositoryImpl({
    required this.installmentsRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> addInstallment(Installment installment) async {
    if (await networkInfo.hasConnection) {
      try {
        // final install = InstallmentModel(
        //   ID: installment.ID,
        //   clientID: installment.clientID,
        //   dateContract: installment.dateContract,
        //   employeeID: installment.employeeID,
        //   isActive: installment.isActive,
        //   monthlyMoney: installment.monthlyMoney,
        //   notes: installment.notes,
        //   numberOfMonths: installment.numberOfMonths,
        //   paid: installment.paid,
        //   productID: installment.productID,
        //   remaining: installment.remaining,
        //   remainingToFinish: installment.remainingToFinish,
        //   technicianID: installment.technicianID,
        //   totalPrice: installment.totalPrice,
        //   trustReciept: installment.trustReciept,
        // );
        return Right(
          await installmentsRemoteDataSource.addInstallment(
            InstallmentModel(
              ID: installment.ID,
              client: installment.client,
              dateContract: installment.dateContract,
              employee: installment.employee,
              isActive: installment.isActive,
              monthlyMoney: installment.monthlyMoney,
              notes: installment.notes,
              numberOfMonths: installment.numberOfMonths,
              paid: installment.paid,
              product: installment.product,
              remaining: installment.remaining,
              remainingToFinish: installment.remainingToFinish,
              technician: installment.technician,
              totalPrice: installment.totalPrice,
              trustReciept: installment.trustReciept,
            ),
          ),
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteInstallment(String installmentID) {
    // TODO: implement getAllInstallments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Installment>>> getAllInstallments() async {
    if (await networkInfo.hasConnection) {
      try {
        return Right(await installmentsRemoteDataSource.getAllInstallments());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateInstallment(
      Installment installment) async {
    // instead of creating unused variable;
    return await _getMessage(() {
      return installmentsRemoteDataSource.updateInstallment(InstallmentModel(
        ID: installment.ID,
        client: installment.client,
        product: installment.product,
        dateContract: installment.dateContract,
        isActive: installment.isActive,
        monthlyMoney: installment.monthlyMoney,
        notes: installment.notes,
        numberOfMonths: installment.numberOfMonths,
        paid: installment.paid,
        remaining: installment.remaining,
        remainingToFinish: installment.remainingToFinish,
        totalPrice: installment.totalPrice,
        trustReciept: installment.trustReciept,
        technician: installment.technician,
        employee: installment.employee,
      ));
    });
    // final install = InstallmentModel(
    //   ID: installment.ID,
    //   clientID: installment.clientID,
    //   dateContract: installment.dateContract,
    //   employeeID: installment.employeeID,
    //   isActive: installment.isActive,
    //   monthlyMoney: installment.monthlyMoney,
    //   notes: installment.notes,
    //   numberOfMonths: installment.numberOfMonths,
    //   paid: installment.paid,
    //   productID: installment.productID,
    //   remaining: installment.remaining,
    //   remainingToFinish: installment.remainingToFinish,
    //   technicianID: installment.technicianID,
    //   totalPrice: installment.totalPrice,
    //   trustReciept: installment.trustReciept,
    // );
  }

  Future<Either<Failure, Unit>> _getMessage(
      Future<Unit> Function() either) async {
    if (await networkInfo.hasConnection) {
      try {
        either();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
