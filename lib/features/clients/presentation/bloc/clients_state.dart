part of 'clients_bloc.dart';

abstract class ClientsState extends Equatable {
  const ClientsState();

  @override
  List<Object> get props => [];
}

class ClientsInitialState extends ClientsState {}

class ClientsLodingState extends ClientsState {}

class ClientsLoadedSuccessfullyState extends ClientsState {
  final List<Client> clients;

  const ClientsLoadedSuccessfullyState({required this.clients});
}

class ClientAddedSuccessfullyState extends ClientsState {}

class ClientAddErrorState extends ClientsState {}

class ClientGetOneSuccessfullyState extends ClientsState {
  final Client client;
  const ClientGetOneSuccessfullyState({required this.client});
}

class ClientGetOneErrorState extends ClientsState {
  final String error;
  const ClientGetOneErrorState({required this.error});
}
