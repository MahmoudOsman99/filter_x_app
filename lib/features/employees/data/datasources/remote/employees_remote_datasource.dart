import 'package:dartz/dartz.dart';

import '../../models/employee_model.dart';

abstract class EmployeesRemoteDatasource {
  Future<List<EmployeeModel>> allEmployees();
  Future<EmployeeModel> getOneEmployeeById(String employeeId);
  Future<Unit> addEmployee(EmployeeModel employeeModel);
  Future<Unit> updateEmployee(EmployeeModel employeeModel);
  Future<Unit> deleteEmployee(String employeeId);
}
