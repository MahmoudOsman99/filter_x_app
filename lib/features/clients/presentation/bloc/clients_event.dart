part of 'clients_bloc.dart';

abstract class ClientsEvent extends Equatable {
  const ClientsEvent();

  @override
  List<Object> get props => [];
}

class GetAllClientsEvent extends ClientsEvent {}

class AddClientEvent extends ClientsEvent {
  final Client client;

  const AddClientEvent({required this.client});

  @override
  List<Object> get props => [client];
}

class GetOneClientByIdEvent extends ClientsEvent {
  final String clientId;

  const GetOneClientByIdEvent({required this.clientId});

  @override
  List<Object> get props => [clientId];
}
