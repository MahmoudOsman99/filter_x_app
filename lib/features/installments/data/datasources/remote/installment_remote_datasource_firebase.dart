import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/network/network_info.dart';

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
  Future<Unit> deleteAllInstallment(String installmentID) {
    // TODO: implement deleteAllInstallment
    throw UnimplementedError();
  }

  @override
  Future<List<InstallmentModel>> getAllInstallments() async {
    await db
        .collection(CollectionsNames.installmentsCollectionFirebaseNameText)
        .get()
        .then((installments) {
      installments.docs.forEach((install) {
        print(install.id);
      });
    });
    final List<InstallmentModel> l = [];
    return l;
  }

  @override
  Future<Unit> updateInstallment(InstallmentModel installmentModel) {
    // TODO: implement updateInstallment
    throw UnimplementedError();
  }
}
