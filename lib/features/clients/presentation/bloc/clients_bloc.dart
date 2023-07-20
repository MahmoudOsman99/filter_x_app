import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/clients/domain/usecases/add_client_usecase.dart';
import 'package:filter_x/features/clients/domain/usecases/get_one_client.dart';

import '../../../../core/Strings/app_strings.dart';
import '../../domain/entities/client.entity.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final AddClientUseCase addClientUseCase;
  final GetOneClientUseCase getOneClientUseCase;

  ClientsBloc({
    required this.addClientUseCase,
    required this.getOneClientUseCase,
  }) : super(ClientsInitialState()) {
    on<ClientsEvent>((event, emit) async {
      if (event is AddClientEvent) {
        emit(ClientsLodingState());
        final c = await addClientUseCase(event.client);
        c.fold(
          (failure) => emit(ClientsLodingState()),
          (r) => emit(ClientAddedSuccessfullyState()),
        );
      } else if (event is GetOneClientByIdEvent) {
        emit(ClientsLodingState());
        try {
          final getClient = await getOneClientUseCase(event.clientId);
          getClient.fold(
              (failure) => emit(
                  ClientGetOneErrorState(error: _mapFailureToMessage(failure))),
              (client) => emit(ClientGetOneSuccessfullyState(client: client)));
        } catch (error) {
          print(error);
        }
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessageTextArabic;
      case OfflineFailure:
        return AppStrings.offlineFailureMessageTextArabic;
      case RequestedDataIsNotAvailableFailure:
        return AppStrings.requestedDataIsNotAvailableTextArabic;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
