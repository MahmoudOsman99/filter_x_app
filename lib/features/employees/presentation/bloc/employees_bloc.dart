import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/features/employees/domain/usecases/add_employee_usecase.dart';
import 'package:filter_x/features/employees/domain/usecases/get_all_employee_usecase.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

import '../../../../core/Strings/app_strings.dart';
import '../../../../core/error/failures.dart';
import 'employees_event.dart';
part 'employees_state.dart';

class EmployeessBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final GetAllEmployeesUsecase getAllEmployeesUseCase;
  final AddEmployeeUsecase addEmployeeUsecase;

  EmployeessBloc({
    required this.getAllEmployeesUseCase,
    required this.addEmployeeUsecase,
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
        // eitherFailureOrState(employeessList);
      } else if (event is AddEmployeeEvent) {
        emit(EmployeesLoadingState());
        // addTechnicianUsecase(event.tech).then(
        //   (value) {
        //     print(value);
        //     emit(AddTechnicianSuccessfullyState());
        //     return Right(value);
        //   },
        // ).catchError(
        //   (error) {
        //     print(error.toString());
        //     emit(AddUpdateDeletTechnicianErrorState(error: error));
        //     throw Left(ServerFailure());
        //   },
        // );

        // eitherFailureOrUnitState(await addTechnicianUsecase(event.tech));
      }
    });
  }

  EmployeesState eitherFailureOrState(
      Either<Failure, List<EmployeeEntity>> either) {
    return either.fold(
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
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
