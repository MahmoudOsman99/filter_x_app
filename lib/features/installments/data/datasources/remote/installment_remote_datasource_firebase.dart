import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/error/exceptions.dart';
import 'package:filter_x/core/network/network_info.dart';
import 'package:filter_x/core/shared/my_converter.dart';
import 'package:filter_x/features/clients/data/models/client_model.dart';
import 'package:filter_x/features/clients/domain/entities/client.entity.dart';
import 'package:filter_x/features/device/data/models/product_model.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/employees/data/models/employee_model.dart';
import 'package:filter_x/features/employees/domain/entities/employee_entity.dart';

import 'package:filter_x/features/installments/data/models/installment_model.dart';

import 'installments_remote_datasource.dart';

class InstallmentsRemoteDataSourceImplByFirebase
    extends InstallmentsRemoteDataSource {
  final db = FirebaseFirestore.instance;
  final NetworkInfo networkInfo;

  InstallmentsRemoteDataSourceImplByFirebase({required this.networkInfo});
  @override
  Future<Unit> addInstallment(InstallmentModel installmentModel) async {
    final insRef =
        db.collection(CollectionsNames.installmentsCollectionFirebaseNameText);

    await insRef.add(InstallmentModel.toJson(installmentModel)).then((value) {
      print(value);
      return Future.value(value);
    }).catchError((onError) {
      print(onError);
    });
    return unit;
  }

  @override
  Future<Unit> deleteAllInstallment(String installmentID) async {
    if (await networkInfo.hasConnection) {
      final install = db
          .collection(CollectionsNames.clientsCollectionFirebaseNameText)
          .doc(installmentID);

      try {
        final value = await install.get();
        if (value.exists) {
          if (value.data()!['isActive'] == true) {
            throw OnGoingProcessException();
          } else {
            await install.delete();
            return Future.value(unit);
          }
        }
        return Future.value(unit);
      } catch (error) {
        print(error.toString());
        throw ServerException();
      }
    } else {
      throw OfflineException();
    }
  }
  // @override
  // Future<Unit> deleteAllInstallment(String installmentID) async {
  //   if (await networkInfo.hasConnection) {
  //     final install = db
  //         .collection(CollectionsNames.installmentsCollectionFirebaseNameText)
  //         .doc(installmentID);
  //     install.get().then((value) {
  //       if (value.exists) {
  //         if (value.data()!['isActive'] == true) {
  //           throw OnGoingProcessException();
  //         } else {
  //           install.delete();
  //           return Future.value(unit);
  //         }
  //       }
  //       return Future.value(unit);
  //     }).onError((error, stackTrace) {
  //       print(error.toString());
  //       throw ServerException();
  //     });
  //   } else {
  //     throw OfflineException();
  //   }
  // }

  @override
  Future<List<InstallmentModel>> getAllInstallments() async {
    final List<InstallmentModel> installmentsList = [];

    // late Client client;
    // late Product product;
    // late Employee technician;
    // late Employee employee;

    // await db
    //     .collection(CollectionsNames.installmentsCollectionFirebaseNameText)
    //     .get()
    //     .then((installments) async {
    //   for (int i = 0; i < installments.docs.length; i++) {
    //     await db
    //         .collection(CollectionsNames.clientsCollectionFirebaseNameText)
    //         .doc(installments.docs[i].data()['clientID'])
    //         .get()
    //         .then(
    //       (c) {
    //         client = ClientModel.fromJson(
    //             idFromCloudFireStore: c.id, json: c.data()!);
    //       },
    //     );
    //     await db
    //         .collection(CollectionsNames.productsCollectionFirebaseNameText)
    //         .doc(installments.docs[i].data()['productID'])
    //         .get()
    //         .then(
    //           (prod) => product = ProductModel.fromJson(
    //             product: prod.data()!,
    //             idFromCloudFireStore: prod.id,
    //           ),
    //         );
    //     await db
    //         .collection(CollectionsNames.employeesCollectionFirebaseNameText)
    //         .doc(installments.docs[i].data()['technicianID'])
    //         .get()
    //         .then(
    //           (tech) => technician = EmployeeModel.fromJson(
    //             employee: tech.data()!,
    //             idFromCloudFireStore: tech.id,
    //           ),
    //         );
    //     await db
    //         .collection(CollectionsNames.employeesCollectionFirebaseNameText)
    //         .doc(installments.docs[i].data()['employeeID'])
    //         .get()
    //         .then(
    //           (emp) => employee = EmployeeModel.fromJson(
    //             employee: emp.data()!,
    //             idFromCloudFireStore: emp.id,
    //           ),
    //         );
    //   }
    //   installments.docs.forEach((install) {
    //     installmentsList.add(
    //       InstallmentModel(
    //         ID: install.id,
    //         client: client,
    //         product: product,
    //         totalPrice: install['totalPrice'],
    //         paid: install['paid'],
    //         remaining: install['remaining'],
    //         numberOfMonths: install['numberOfMonths'],
    //         monthlyMoney: install['monthlyMoney'],
    //         notes: install['notes'],
    //         isActive: install['isActive'],
    //         dateContract: MyConverter.convertFromTimestampToDateTime(
    //             install['dateContract']),
    //         remainingToFinish: install['remainingToFinish'],
    //         trustReciept: install['trustReciept'],
    //         employee: employee,
    //         technician: technician,
    //       ),
    //     );
    //   });
    // });

    // return installmentsList;

///////////////////
    final installmentsQuerySnapshot = await db
        .collection(CollectionsNames.installmentsCollectionFirebaseNameText)
        .get();

    await Future.forEach(installmentsQuerySnapshot.docs, (installment) async {
      final clientSnapshot = await db
          .collection(CollectionsNames.clientsCollectionFirebaseNameText)
          .doc(installment.data()['clientID'])
          .get();
      final productSnapshot = await db
          .collection(CollectionsNames.productsCollectionFirebaseNameText)
          .doc(installment.data()['productID'])
          .get();
      final technicianSnapshot = await db
          .collection(CollectionsNames.employeesCollectionFirebaseNameText)
          .doc(installment.data()['technicianID'])
          .get();
      final employeeSnapshot = await db
          .collection(CollectionsNames.employeesCollectionFirebaseNameText)
          .doc(installment.data()['employeeID'])
          .get();

      final client = ClientModel.fromJson(
          idFromCloudFireStore: clientSnapshot.id,
          json: clientSnapshot.data()!);
      final product = ProductModel.fromJson(
          product: productSnapshot.data()!,
          idFromCloudFireStore: productSnapshot.id);
      final technician = EmployeeModel.fromJson(
          employee: technicianSnapshot.data()!,
          idFromCloudFireStore: technicianSnapshot.id);
      final employee = EmployeeModel.fromJson(
          employee: employeeSnapshot.data()!,
          idFromCloudFireStore: employeeSnapshot.id);

      installmentsList.add(
        InstallmentModel(
          ID: installment.id,
          client: client,
          product: product,
          totalPrice: installment['totalPrice'],
          paid: installment['paid'],
          remaining: installment['remaining'],
          numberOfMonths: installment['numberOfMonths'],
          monthlyMoney: installment['monthlyMoney'],
          notes: installment['notes'],
          isActive: installment['isActive'],
          dateContract: MyConverter.convertFromTimestampToDateTime(
              installment['dateContract']),
          remainingToFinish: installment['remainingToFinish'],
          trustReciept: installment['trustReciept'],
          employee: employee,
          technician: technician,
        ),
      );
    });

    return installmentsList;
  }

  // final List<InstallmentModel> installmentsList = [];
  // late Client client;
  // late Product product;
  // late Employee technician;
  // late Employee employee;

  // await db
  //     .collection(CollectionsNames.installmentsCollectionFirebaseNameText)
  //     .get()
  //     .then((installments) async {
  //   for (int i = 0; i < installments.docs.length; i++) {
  //     await db
  //         .collection(CollectionsNames.clientsCollectionFirebaseNameText)
  //         .doc(installments.docs[i].data()['clientID'])
  //         .get()
  //         .then(
  //       (c) {
  //         client = ClientModel.fromJson(
  //             idFromCloudFireStore: c.id, json: c.data()!);
  //       },
  //     );
  //     await db
  //         .collection(CollectionsNames.productsCollectionFirebaseNameText)
  //         .doc(installments.docs[i].data()['productID'])
  //         .get()
  //         .then(
  //           (prod) => product = ProductModel.fromJson(
  //             product: prod.data()!,
  //             idFromCloudFireStore: prod.id,
  //           ),
  //         );
  //     await db
  //         .collection(CollectionsNames.employeesCollectionFirebaseNameText)
  //         .doc(installments.docs[i].data()['technicianID'])
  //         .get()
  //         .then(
  //           (tech) => technician = EmployeeModel.fromJson(
  //             employee: tech.data()!,
  //             idFromCloudFireStore: tech.id,
  //           ),
  //         );
  //     await db
  //         .collection(CollectionsNames.employeesCollectionFirebaseNameText)
  //         .doc(installments.docs[i].data()['employeeID'])
  //         .get()
  //         .then(
  //           (emp) => employee = EmployeeModel.fromJson(
  //             employee: emp.data()!,
  //             idFromCloudFireStore: emp.id,
  //           ),
  //         );
  //   }
  //   installments.docs.forEach((install) {
  //     installmentsList.add(
  //       InstallmentModel(
  //         ID: install.id,
  //         client: client,
  //         product: product,
  //         totalPrice: install['totalPrice'],
  //         paid: install['paid'],
  //         remaining: install['remaining'],
  //         numberOfMonths: install['numberOfMonths'],
  //         monthlyMoney: install['monthlyMoney'],
  //         notes: install['notes'],
  //         isActive: install['isActive'],
  //         dateContract: MyConverter.convertFromTimestampToDateTime(
  //             install['dateContract']),
  //         remainingToFinish: install['remainingToFinish'],
  //         trustReciept: install['trustReciept'],
  //         employee: employee,
  //         technician: technician,
  //       ),
  //     );
  //   });
  // });

  // print('${listInstallments[0]}');
  //   return installmentsList;
  // }

  @override
  Future<Unit> updateInstallment(InstallmentModel installmentModel) {
    // TODO: implement updateInstallment
    throw UnimplementedError();
  }
}
