// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel(
      {id,
      name,
      nationalID,
      address,
      phone,
      phone2,
      dateOfHiring,
      isActive,
      position,
      salary,
      imagePath})
      : super(
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
      {/*String? idFromCloudFireStore,*/ required Map<String, dynamic> tech}) {
    // print(int.parse(tech['dateOfHiring']));
    return EmployeeModel(
      id: tech['id'],
      name: tech['name'],
      nationalID: tech['nationalID'],
      address: tech['address'],
      phone: tech['phone'],
      phone2: tech['phone2'],
      dateOfHiring: DateTime.parse(tech['dateOfHiring']),
      isActive: tech['isActive'],
      position: tech['position'],
      salary: tech['salary'],
      imagePath: tech['imagePath'],
    );
  }

  static Map<String, dynamic> toJson(EmployeeModel employee) {
    return {
      'name': employee.name,
      'nationalID': employee.nationalID,
      'address': employee.address,
      'phone': employee.phone,
      'phone2': employee.phone2,
      'dateOfHiring': employee.dateOfHiring.toString(),
      'isActive': employee.isActive,
      'position': employee.position,
      'salary': employee.salary,
      'imagePath': employee.imagePath,
    };
  }
}
