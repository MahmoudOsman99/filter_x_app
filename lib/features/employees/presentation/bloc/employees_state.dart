part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

class EmployeesInitial extends EmployeesState {}

/// Loading for adding update delete employee
class EmployeesLoadingState extends EmployeesState {}

class EmployeesLoadedSuccessfullyState extends EmployeesState {
  final List<Employee> employees;

  const EmployeesLoadedSuccessfullyState({required this.employees});
  @override
  List<Object> get props => [employees];
}

class EmployeesErrorState extends EmployeesState {
  final String error;

  const EmployeesErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class AddEmployeeSuccessfullyState extends EmployeesState {}

class AddUpdateDeletEmployeeErrorState extends EmployeesState {
  final String error;

  const AddUpdateDeletEmployeeErrorState({required this.error});
}

class GetOneEmployeeSuccessfullyState extends EmployeesState {
  final Employee employee;

  const GetOneEmployeeSuccessfullyState(this.employee);
}
