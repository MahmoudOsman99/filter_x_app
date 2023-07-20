import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

typedef FailureOrUnit = Future<Either<Failure, Unit>>;

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getAllEmployees();
  Future<Either<Failure, Employee>> getOneEmployeeById(String employeeId);
  FailureOrUnit addEmployee(Employee employee);
  FailureOrUnit updateEmployee(Employee employee);
  FailureOrUnit deleteEmployee(String employeeId);
}
