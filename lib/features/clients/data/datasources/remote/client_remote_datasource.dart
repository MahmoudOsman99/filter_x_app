import 'package:dartz/dartz.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';

import '../../models/client_model.dart';

abstract class ClientRemoteDatasource {
  // Future<List<ClientModel>> getAllClients();
  // Future<Unit> deleteAllInstallment(String clientID);
  // Future<Unit> updateInstallment(InstallmentModel installmentModel);
  Future<ClientModel> getOneClientById(String clientId);
  Future<Unit> addClient(ClientModel client);
}
