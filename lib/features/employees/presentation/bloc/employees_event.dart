import 'package:equatable/equatable.dart';

import '../../domain/entities/employee_entity.dart';

// part of 'Employees_bloc.dart';

abstract class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class GetAllEmployeesEvent extends EmployeesEvent {}

class EmployeesLoadedSuccessfullyEvent extends EmployeesEvent {
  final List<Employee> employees;

  const EmployeesLoadedSuccessfullyEvent(this.employees);
}

class EmployeesErrorEvent extends EmployeesEvent {}

class AddEmployeeEvent extends EmployeesEvent {
  final Employee employee;

  const AddEmployeeEvent({required this.employee});
}

class GetOneEmployeeByIdEvent extends EmployeesEvent {
  final String employeeId;

  const GetOneEmployeeByIdEvent(this.employeeId);
}
