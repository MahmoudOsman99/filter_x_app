import 'package:dartz/dartz.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import '../../../../core/error/failures.dart';

abstract class ClientRepository {
  Future<Either<Failure, Client>> getOneClient(String clientId);
  Future<Either<Failure, Unit>> addClient(Client client);
}
