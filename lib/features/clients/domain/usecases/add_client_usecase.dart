import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/clients/domain/repositories/client_repository.dart';

class AddClientUseCase {
  final ClientRepository repo;
  const AddClientUseCase({required this.repo});

  Future<Either<Failure, Unit>> call(Client client) async {
    return await repo.addClient(client);
  }
}
