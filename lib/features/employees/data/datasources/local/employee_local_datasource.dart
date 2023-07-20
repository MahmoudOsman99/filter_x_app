import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:filter_x/core/error/exceptions.dart';
// import 'package:filter_x/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/employee_model.dart';

abstract class EmployeeLocalDataSource {
  Future<Unit> cacheEmployees(String employeesList);
  Future<List<EmployeeModel>> get getAllEmployees;
}

class EmployeeLocalDataSourceImpl implements EmployeeLocalDataSource {
  final SharedPreferences sharedPref;
  EmployeeLocalDataSourceImpl({required this.sharedPref});

  static const String _empName = 'employees';

  @override
  Future<Unit> cacheEmployees(String employeesList) {
    sharedPref.setString(_empName, json.encode(employeesList));
    return Future.value(unit);
  }

  @override
  Future<List<EmployeeModel>> get getAllEmployees async {
    String? stringJson = sharedPref.getString(_empName);
    if (stringJson != null) {
      List dataFromJson = json.decode(stringJson);

      return Future.value(dataFromJson
          .map<EmployeeModel>((tech) => EmployeeModel.fromJson(employee: tech))
          .toList());
    } else {
      return throw EmptyCacheException();
    }
  }
}
