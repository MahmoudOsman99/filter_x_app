import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/error/exceptions.dart';

import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/features/employees/data/models/employee_model.dart';

import 'employees_remote_datasource.dart';

class EmployeesRemoteDatasourceImplFirebase extends EmployeesRemoteDatasource {
  final db = FirebaseFirestore.instance;
  final NetworkInfo networkInfo;

  EmployeesRemoteDatasourceImplFirebase({required this.networkInfo});

  @override
  Future<Unit> addEmployee(EmployeeModel employeeModel) async {
    await db
        .collection(CollectionsNames.employeesCollectionFirebaseNameText)
        .add(EmployeeModel.toJson(employeeModel))
        .then((value) {
      // print(value);
      return value;
    }).catchError((error) {
      print('${error.toString()} ------------------------------');
    });
    return Future.value(unit);
  }

  @override
  Future<List<EmployeeModel>> allEmployees() async {
    final List<EmployeeModel> employeesList = [];
    if (await networkInfo.hasConnection) {
      try {
        final employees = await db
            .collection(CollectionsNames.employeesCollectionFirebaseNameText)
            .get();
        for (int i = 0; i < employees.docs.length; i++) {
          employeesList.add(
            EmployeeModel.fromJson(
              idFromCloudFireStore: employees.docs[i].id,
              employee: employees.docs[i].data(),
            ),
          );
          print(employeesList[i]);
        }
      } catch (e) {
        print('-----------------------------------');
        throw ServerException();
      }
      // print(techniciansList);
      return employeesList;
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<Unit> deleteEmployee(String employeeId) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateEmployee(EmployeeModel employeeModel) {
    throw UnimplementedError();
  }

  @override
  Future<EmployeeModel> getOneEmployeeById(String employeeId) async {
    // try {
    final emp = await db
        .collection(CollectionsNames.employeesCollectionFirebaseNameText)
        .doc(employeeId)
        .get();
    return EmployeeModel.fromJson(
      employee: emp.data()!,
    );
    // } else {
    //   throw RequestedDataIsNotAvailableException();
    // }
    // } catch (e) {
    //   throw RequestedDataIsNotAvailableException();
    // }
  }

  // @override
  // Future<EmployeeModel> getOneEmployeeById(String employeeId) async {
  //   try {
  //     final emp = await db
  //         .collection(CollectionsNames.employeesCollectionFirebaseNameText)
  //         .doc(employeeId);

  //     // if (emp.isUndefinedOrNull) {
  //     //   print('null emp');
  //     // } else {
  //     //   throw RequestedDataIsNotAvailableException();
  //     // }
  //   } catch (e) {
  //     throw ServerException();
  //   }
  //   return EmployeeModel();
  // }
}
