import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';

import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/employees/data/datasources/local/employee_local_datasource.dart';
import 'package:filter_x/features/employees/data/models/employee_model.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

import '../../domain/repositories/employees_repository.dart';
import '../datasources/remote/employees_remote_datasource.dart';

typedef AddDeleteUpdate = Future<Unit> Function();

class EmployeesRepositoryImpl extends EmployeeRepository {
  final NetworkInfo networkInfo;
  final EmployeesRemoteDatasource employeeRemoteDatasource;
  final EmployeeLocalDataSource employeeLocalDatasource;

  EmployeesRepositoryImpl({
    required this.networkInfo,
    required this.employeeRemoteDatasource,
    required this.employeeLocalDatasource,
  });

  @override
  FailureOrUnit addEmployee(Employee employee) async {
    //todo network check
    final emp = EmployeeModel(
      address: employee.address,
      name: employee.name,
      nationalID: employee.nationalID,
      phone: employee.phone,
      phone2: employee.phone2,
      dateOfHiring: employee.dateOfHiring,
      isActive: employee.isActive,
      position: employee.position,
      salary: employee.salary,
      imagePath: employee.imagePath,
    );
    return await _getMessage(() {
      return employeeRemoteDatasource.addEmployee(emp);
    });
    // return Future.value(unit);
  }

  @override
  Future<Either<Failure, List<Employee>>> getAllEmployees() async {
    final List<Employee> employees;
    if (await networkInfo.hasConnection) {
      try {
        employees = await employeeRemoteDatasource.allEmployees();
        await employeeLocalDatasource.cacheEmployees(employees.toString());
        return Right(employees);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    // else {
    //   technicians = await techLocalDatasource.getAllTechnicians;
    // }
    return Future.value();
  }

  Future<Either<Failure, Unit>> _getMessage(
      AddDeleteUpdate addDeleteUpdateTech) async {
    if (await networkInfo.hasConnection) {
      try {
        await addDeleteUpdateTech();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  FailureOrUnit deleteEmployee(String empId) {
    // TODO: implement deleteEmployee
    throw UnimplementedError();
  }

  @override
  FailureOrUnit updateEmployee(Employee employee) {
    // TODO: implement updateEmployee
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Employee>> getOneEmployeeById(
      String employeeId) async {
    if (await networkInfo.hasConnection) {
      final EmployeeModel emp =
          await employeeRemoteDatasource.getOneEmployeeById(employeeId);
      return Right(EmployeeModel(
        id: emp.id,
        address: emp.address,
        dateOfHiring: emp.dateOfHiring,
        position: emp.position,
        imagePath: emp.imagePath,
        salary: emp.salary,
        isActive: emp.isActive,
        name: emp.name,
        nationalID: emp.nationalID,
        phone: emp.phone,
        phone2: emp.phone,
      ));
    } else {
      throw OfflineFailure();
    }
  }
}
