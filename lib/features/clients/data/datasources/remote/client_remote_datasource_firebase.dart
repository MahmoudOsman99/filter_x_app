import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/clients/data/models/client_model.dart';

import 'package:filter_x/features/installments/data/models/installment_model.dart';

import 'client_remote_datasource.dart';

class ClientsRemoteDataSourceImplByFirebase extends ClientRemoteDatasource {
  final db = FirebaseFirestore.instance;
  final NetworkInfo networkInfo;

  ClientsRemoteDataSourceImplByFirebase({required this.networkInfo});

  @override
  Future<ClientModel> getOneClientById(String clientId) async {
    final client = await db
        .collection(CollectionsNames.clientsCollectionFirebaseNameText)
        .doc(clientId)
        .get();
    if (!client.exists) {
      throw RequestedDataIsNotAvailableException();
    }
    return ClientModel.fromJson(
      idFromCloudFireStore: client.id,
      json: client.data()!,
    );
  }

  @override
  Future<Unit> addClient(ClientModel client) async {
    await db
        .collection(CollectionsNames.clientsCollectionFirebaseNameText)
        .add(ClientModel.toJson(client))
        .then((c) {
      print(c);
    });
    return Future.value(unit);
  }
}
