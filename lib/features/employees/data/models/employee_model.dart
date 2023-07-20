// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';
import 'package:intl/intl.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    id,
    name,
    nationalID,
    address,
    phone,
    phone2,
    dateOfHiring,
    isActive,
    position,
    salary,
    imagePath,
  }) : super(
          id: id,
          name: name,
          address: address,
          nationalID: nationalID,
          phone: phone,
          phone2: phone2,
          dateOfHiring: dateOfHiring,
          isActive: isActive,
          position: position,
          salary: salary,
          imagePath: imagePath,
        );
  // const TechnicianModel(
  //   super.id,
  //   super.name,
  //   super.nationalID,
  //   super.address,
  //   super.phone,
  //   super.phone2,
  //   super.dateOfHiring,
  //   super.isActive,
  //   super.position,
  //   super.salary,
  // );

  factory EmployeeModel.fromJson(
      {String? idFromCloudFireStore, required Map<String, dynamic> employee}) {
    Timestamp empDate = employee['dateOfHiring'] as Timestamp;
    // print(int.parse(tech['dateOfHiring']));
    return EmployeeModel(
      id: idFromCloudFireStore ?? employee['id'],
      name: employee['name'],
      nationalID: employee['nationalID'],
      address: employee['address'],
      phone: employee['phone'],
      phone2: employee['phone2'],
      dateOfHiring:
          DateTime.fromMicrosecondsSinceEpoch(empDate.microsecondsSinceEpoch),
      // Timestamp.fromMicrosecondsSinceEpoch(emp.microsecondsSinceEpoch)
      //     .toDate(),
      // dateOfHiring: DateTime.parse(employee['dateOfHiring']),
      isActive: employee['isActive'],
      position: employee['position'],
      salary: employee['salary'],
      imagePath: employee['imagePath'],
    );
  }

  static Map<String, dynamic> toJson(EmployeeModel employee) {
    return {
      'name': employee.name,
      'nationalID': employee.nationalID,
      'address': employee.address,
      'phone': employee.phone,
      'phone2': employee.phone2,
      'dateOfHiring': employee.dateOfHiring,
      'isActive': employee.isActive,
      'position': employee.position,
      'salary': employee.salary,
      'imagePath': employee.imagePath,
    };
  }
}
