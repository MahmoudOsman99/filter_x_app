import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/employee_entity.dart';
import '../repositories/employees_repository.dart';

class GetOneEmployeeByIdUseCase {
  final EmployeeRepository repository;
  GetOneEmployeeByIdUseCase(this.repository);

  Future<Either<Failure, Employee>> call(String employeeId) async {
    return await repository.getOneEmployeeById(employeeId);
  }
}
