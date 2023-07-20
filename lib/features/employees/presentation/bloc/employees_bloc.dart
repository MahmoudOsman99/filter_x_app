import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/features/employees/domain/usecases/add_employee_usecase.dart';
import 'package:filter_x/features/employees/domain/usecases/get_all_employee_usecase.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:filter_x/features/employees/domain/usecases/get_one_employee_by_id_usecase.dart';
import 'package:filter_x/features/installments/presentation/bloc/installments_bloc.dart';

import '../../../../core/Strings/app_strings.dart';
import '../../../../core/Strings/collections_names.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/employee_model.dart';
import 'employees_event.dart';
part 'employees_state.dart';

class EmployeessBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetAllEmployeesUsecase getAllEmployeesUseCase;
  final GetOneEmployeeByIdUseCase getOneEmployeeByIdUseCase;
  final AddEmployeeUsecase addEmployeeUsecase;

  EmployeessBloc({
    required this.getAllEmployeesUseCase,
    required this.addEmployeeUsecase,
    required this.getOneEmployeeByIdUseCase,
  }) : super(EmployeesInitial()) {
    on<EmployeesEvent>((event, emit) async {
      if (event is GetAllEmployeesEvent) {
        emit(EmployeesLoadingState());
        final employeesList = await getAllEmployeesUseCase();
        employeesList.fold(
            (failure) =>
                emit(EmployeesErrorState(error: _mapFailureToMessage(failure))),
            (employees) =>
                emit(EmployeesLoadedSuccessfullyState(employees: employees)));
      }
      if (event is GetOneEmployeeByIdEvent) {
        emit(EmployeesLoadingState());

        getOneEmployeeByIdUseCase(event.employeeId).then((value) {
          value.fold(
              (failure) => emit(
                  EmployeesErrorState(error: _mapFailureToMessage(failure))),
              (emp) => emit(GetOneEmployeeSuccessfullyState(emp)));
        });
      } else if (event is AddEmployeeEvent) {
        emit(EmployeesLoadingState());
        await addEmployeeUsecase(event.employee).whenComplete(() {
          print('Saved ------------------------');
          emit(AddEmployeeSuccessfullyState());
        }).catchError((error) {
          print(error.toString());
        });
        // .then(
        //   (value) {
        //     print(value);
        //     emit(AddEmployeeSuccessfullyState());
        //     return Right(value);
        //   },
        // ).catchError(
        //   (error) {
        //     print(error.toString());
        //     emit(AddUpdateDeletEmployeeErrorState(error: error));
        //     throw Left(ServerFailure());
        //   },
        // );

        // eitherFailureOrUnitState(await addEmployeeUsecase(event.employee));
      }
    });
  }

  Future<EmployeesState> eitherFailureOrState(
      Either<Failure, List<Employee>> either) async {
    return await either.fold(
        (failure) => EmployeesErrorState(error: _mapFailureToMessage(failure)),
        (employees) => EmployeesLoadedSuccessfullyState(employees: employees));
  }

  EmployeesState eitherFailureOrUnitState(Either<Failure, Unit> either) {
    return either.fold(
      (failure) => AddUpdateDeletEmployeeErrorState(
          error: _mapFailureToMessage(failure)),
      (unit) {
        print('-------------------------------------');
        return AddEmployeeSuccessfullyState();
      },
    );
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
