import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/clients/domain/repositories/client_repository.dart';

class GetOneClientUseCase {
  final ClientRepository repo;
  const GetOneClientUseCase({required this.repo});

  Future<Either<Failure, Client>> call(String clientId) async {
    return await repo.getOneClient(clientId);
  }
}
