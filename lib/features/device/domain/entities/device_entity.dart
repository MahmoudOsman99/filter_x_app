import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  late String ID;
  late String name;
  late int NOS;
  late bool hasWarranty;
  late int NOWIfExistInMonth;

  DeviceEntity({
    required this.ID,
    required this.name,
    required this.hasWarranty,
    required this.NOS,
    required this.NOWIfExistInMonth,
  });

  @override
  List<Object?> get props => [ID, name, NOS, hasWarranty, NOWIfExistInMonth];
}
