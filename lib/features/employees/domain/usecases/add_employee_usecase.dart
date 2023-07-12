import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:filter_x/features/employees/domain/repositories/employees_repository.dart';

class AddEmployeeUsecase {
  final EmployeeRepository repo;
  AddEmployeeUsecase(this.repo);

  FailureOrUnit call(EmployeeEntity emp) async {
    return repo.addEmployee(emp);
  }
}
