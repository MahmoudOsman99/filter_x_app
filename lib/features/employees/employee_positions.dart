import 'package:filter_x/core/Strings/app_strings.dart';

enum EmployeePositions {
  owner,
  admin,
  manager,
  employee,
  technician,
  sales,
}

// List<EmployeePositions> getValue = EmployeePositions.values;

String getEmployeePositionName(int index) {
  final empPosition = EmployeePositions.values[index];
  switch (empPosition) {
    case EmployeePositions.owner:
      return AppStrings.employeeOwnerPositionTextArabic;
    case EmployeePositions.manager:
      return AppStrings.employeeManagerPositionTextArabic;
    case EmployeePositions.admin:
      return AppStrings.employeeAdminPositionTextArabic;
    case EmployeePositions.employee:
      return AppStrings.employeeEmployeePositionTextArabic;
    case EmployeePositions.technician:
      return AppStrings.employeeTechnicianPositionTextArabic;
    default:
      return 'Not Specified';
  }
}
