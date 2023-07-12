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
  final List<EmployeeEntity> employees;

  const EmployeesLoadedSuccessfullyEvent(this.employees);
}

class EmployeesErrorEvent extends EmployeesEvent {}

class AddEmployeeEvent extends EmployeesEvent {
  // final EmployeeEntity tech;

  const AddEmployeeEvent();
}
