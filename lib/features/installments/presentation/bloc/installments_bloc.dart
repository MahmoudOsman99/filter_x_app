import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';
import 'package:filter_x/features/installments/domain/usecases/add_installment_usecase.dart';
import 'package:filter_x/features/installments/domain/usecases/delete_installment.dart';
import 'package:filter_x/features/installments/domain/usecases/get_all_installments.dart';
import 'package:filter_x/features/installments/domain/usecases/update_installment_usecase.dart';

part 'installments_event.dart';
part 'installments_state.dart';

class InstallmentsBloc extends Bloc<InstallmentsEvent, InstallmentsState> {
  final GetAllInstallmentsUsecase getAllInstallmentsUsecase;
  final AddInstallmentUsecase addInstallmentUsecase;
  final UpdateInstallmentUsecase updateInstallmentUsecase;
  final DeleteInstallmentUsecase deleteInstallmentUsecase;

  InstallmentsBloc({
    required this.getAllInstallmentsUsecase,
    required this.addInstallmentUsecase,
    required this.updateInstallmentUsecase,
    required this.deleteInstallmentUsecase,
  }) : super(InstallmentsInitialState()) {
    on<InstallmentsEvent>((event, emit) async {
      if (event is GetAllInstallmentsEvent) {
        emit(InstallmentLoadingState());
        final getAllInstallProcess = await getAllInstallmentsUsecase();
        getAllInstallProcess.fold(
          (failure) =>
              emit(InstallmentErrorState(error: _mapFailureToMessage(failure))),
          (installments) => emit(
              InstallmentLoadedSuccessfullyState(installemnt: installments)),
        );
      } else if (event is AddInstallmentEvent) {
        final addProcess = await addInstallmentUsecase(Installment(
          ID: 'null',
          clientID: 'clientID',
          dateContract: DateTime.now(),
          employeeID: 'employeeID',
          isActive: true,
          monthlyMoney: 250,
          notes: 'notes',
          numberOfMonths: 10,
          paid: 500,
          productID: 'productID',
          remaining: 2000,
          remainingToFinish: 2000,
          technicianID: 'technicianID',
          totalPrice: 2500,
          trustReciept: true,
        ));

        addProcess.fold(
          (failure) => emit(
              InstallmentAddErrorState(error: _mapFailureToMessage(failure))),
          (_) => emit(InstallmentAddSuccessfullyState()),
        );
      }
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailureMessageTextArabic;
    case OfflineFailure:
      return AppStrings.offlineFailureMessageTextArabic;
    default:
      return AppStrings.somethingWentWrongTextArabic;
  }
}
