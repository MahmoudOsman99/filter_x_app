import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';

import '../../models/employee_model.dart';

abstract class EmployeesRemoteDatasource {
  Future<List<EmployeeModel>> allEmployees();
  Future<Unit> addEmployee(EmployeeModel employeeModel);
  Future<Unit> updateEmployee(EmployeeModel employeeModel);
  Future<Unit> deleteEmployee(String employeeId);
}
