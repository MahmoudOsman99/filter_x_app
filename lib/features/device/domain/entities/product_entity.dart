import 'package:equatable/equatable.dart';

class Product extends Equatable {
  late String? ID;
  late String name;
  late int NOS;
  late bool hasWarranty;
  late int NOWIfExistInMonth;
  late int productCount;

  Product({
    required this.ID,
    required this.name,
    required this.hasWarranty,
    required this.NOS,
    required this.NOWIfExistInMonth,
    required this.productCount,
  });

  @override
  List<Object?> get props => [
        ID,
        name,
        NOS,
        hasWarranty,
        NOWIfExistInMonth,
        productCount,
      ];
}
