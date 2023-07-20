import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/clients/domain/usecases/get_one_client.dart';
import 'package:filter_x/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/domain/usecases/get__one_product_by_id_usecase.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';
import 'package:filter_x/features/installments/domain/usecases/add_installment_usecase.dart';
import 'package:filter_x/features/installments/domain/usecases/delete_installment.dart';
import 'package:filter_x/features/installments/domain/usecases/get_all_installments.dart';
import 'package:filter_x/features/installments/domain/usecases/update_installment_usecase.dart';

import '../../../employees/domain/usecases/get_one_employee_by_id_usecase.dart';

part 'installments_event.dart';
part 'installments_state.dart';

class InstallmentsBloc extends Bloc<InstallmentsEvent, InstallmentsState> {
  final GetAllInstallmentsUsecase getAllInstallmentsUsecase;
  final AddInstallmentUsecase addInstallmentUsecase;
  final UpdateInstallmentUsecase updateInstallmentUsecase;
  final DeleteInstallmentUsecase deleteInstallmentUsecase;
  final GetOneEmployeeByIdUseCase getOneEmployeeByIdUsecase;
  final GetOneProductByIdUsecase getOneProductByIdUsecase;
  final GetOneClientUseCase getOneClientUseCase;

  InstallmentsBloc({
    required this.getAllInstallmentsUsecase,
    required this.addInstallmentUsecase,
    required this.updateInstallmentUsecase,
    required this.deleteInstallmentUsecase,
    required this.getOneEmployeeByIdUsecase,
    required this.getOneProductByIdUsecase,
    required this.getOneClientUseCase,
  }) : super(InstallmentsInitialState()) {
    on<InstallmentsEvent>((event, emit) async {
      if (event is GetAllInstallmentsEvent) {
        try {
          emit(InstallmentLoadingState());
          final getAllInstallProcess = await getAllInstallmentsUsecase();
          getAllInstallProcess.fold(
              (failure) => emit(
                  InstallmentErrorState(error: _mapFailureToMessage(failure))),
              (value) {
            emit(
              InstallmentLoadedSuccessfullyState(
                installemnt: value,
              ),
            );
          });
          // final getOneProduct =
          //     await getOneProductByIdUsecase(installments[0].product);

          // getOneProduct.fold(
          //     (failure) => emit(
          //         InstallmentErrorState(error: _mapFailureToMessage(failure))),
          //     (prod) => product = prod);

          // final getOneEmp =
          //     await getOneEmployeeByIdUsecase(installments[0].technician);
          // getOneEmp.fold(
          //     (failure) => emit(
          //         InstallmentErrorState(error: _mapFailureToMessage(failure))),
          //     (emp) => employee = emp);

          // final getOneClient =
          //     await getOneClientUseCase(installments[0].clientID);
          // getOneClient.fold(
          //     (failure) => emit(
          //         InstallmentErrorState(error: _mapFailureToMessage(failure))),
          //     (returnedClient) => client = returnedClient);
        } catch (error) {
          print(error);
        }
      } else if (event is GetOneInstallmentEvent) {
        // emit(InstallmentLoadingState());
        // final getAllInstallProcess = await getAllInstallmentsUsecase();
        // // final getOneEmployeeProcess = await getOneEmployeeByIdUsecase();

        // getAllInstallProcess.fold(
        //   (failure) {
        //     emit(InstallmentErrorState(error: _mapFailureToMessage(failure)));
        //   },
        //   (installments) async {
        //     final getOneEmployeeProcess =
        //         await getOneEmployeeByIdUsecase(installments[0].technician);
        //     Employee? employee;
        //     getOneEmployeeProcess.fold(
        //       (failure) => _mapFailureToMessage(failure),
        //       (install) => employee = install,
        //     );
        //     emit(InstallmentGetOneSuccessfullyState(
        //         installment: installments[0], employee: employee!));
        //   },
        // );
      }
      // else if (event is AddInstallmentEvent) {
      //   final addProcess = await addInstallmentUsecase(Installment(
      //     clientID: event.installment!.clientID,
      //     // client: Client(
      //     //   cardNumber: cardNumber,
      //     //   name: name,
      //     //   address: address,
      //     //   phone: phone,
      //     //   phone2: phone2,
      //     //   devices: devices,
      //     //   dateOfContract: dateOfContract,
      //     //   indoor: indoor,
      //     //   isInstallment: isInstallment,
      //     //   governorateID: governorateID,
      //     //   isActiveToTechnicalVisits: isActiveToTechnicalVisits,
      //     //   technicianID: technicianID,
      //     //   employeeID: employeeID,
      //     //   notes: notes,
      //     // ),
      //     dateContract: DateTime.now(),
      //     employeeID: event.installment!.employeeID,
      //     isActive: true,
      //     monthlyMoney: 250,
      //     notes: 'notes',
      //     numberOfMonths: 10,
      //     paid: 500,
      //     productID: event.installment!.productID,
      //     remaining: 2000,
      //     remainingToFinish: 2000,
      //     technicianID: event.installment!.technicianID,
      //     totalPrice: 2500,
      //     trustReciept: true,
      //   ));

      //   addProcess.fold(
      //     (failure) => emit(
      //         InstallmentAddErrorState(error: _mapFailureToMessage(failure))),
      //     (_) => emit(InstallmentAddSuccessfullyState()),
      //   );
      // }
    });
  }
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
      return AppStrings.somethingWentWrongTextArabic;
  }
}
