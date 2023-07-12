import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/failures.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import '../repositories/employees_repository.dart';

class GetAllEmployeesUsecase {
  final EmployeeRepository repository;
  GetAllEmployeesUsecase(this.repository);

  Future<Either<Failure, List<EmployeeEntity>>> call() async {
    return await repository.getAllEmployees();
  }
}
