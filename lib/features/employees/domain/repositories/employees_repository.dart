import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

typedef FailureOrUnit = Future<Either<Failure, Unit>>;

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees();
  FailureOrUnit addEmployee(EmployeeEntity employee);
  FailureOrUnit updateEmployee(EmployeeEntity employee);
  FailureOrUnit deleteEmployee(String employeeId);
}
