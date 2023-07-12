import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final String? id;
  final String name;
  final String nationalID;
  final String address;
  final String phone;
  final String phone2;
  final DateTime dateOfHiring;
  final bool isActive;
  final int position;
  final double salary;
  final String? imagePath;

  const EmployeeEntity({
    this.id,
    required this.name,
    required this.nationalID,
    required this.address,
    required this.phone,
    required this.phone2,
    required this.dateOfHiring,
    required this.isActive,
    required this.position,
    required this.salary,
    this.imagePath,
  });

  @override
  List<Object?> get props => [
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
        imagePath
      ];
}
