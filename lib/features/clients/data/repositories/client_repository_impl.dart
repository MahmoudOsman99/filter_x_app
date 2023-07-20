import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/clients/data/datasources/remote/client_remote_datasource.dart';
import 'package:filter_x/features/clients/data/models/client_model.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/clients/domain/repositories/client_repository.dart';
import 'package:flutter/material.dart';

class ClientRepositoryImpl extends ClientRepository {
  final NetworkInfo networkInfo;
  final ClientRemoteDatasource clientRemoteDatasource;

  ClientRepositoryImpl({
    required this.networkInfo,
    required this.clientRemoteDatasource,
  });

  @override
  Future<Either<Failure, Client>> getOneClient(String clientId) async {
    if (await networkInfo.hasConnection) {
      return Right(await clientRemoteDatasource.getOneClientById(clientId));
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<Either<Failure, Unit>> addClient(Client client) async {
    if (await networkInfo.hasConnection) {
      return Right(await clientRemoteDatasource.addClient(ClientModel(
        cardNumber: client.cardNumber,
        name: client.name,
        address: client.address,
        phone: client.phone,
        phone2: client.phone2,
        devices: client.devices,
        dateOfContract: client.dateOfContract,
        indoor: client.indoor,
        isInstallment: client.isInstallment,
        governorateID: client.governorateID,
        isActiveToTechnicalVisits: client.isActiveToTechnicalVisits,
        technicianID: client.technicianID,
        employeeID: client.employeeID,
        notes: client.notes,
      )));
    } else {
      throw OfflineException();
    }
  }
}
