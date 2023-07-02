import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filter_x/config/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/config/strings.dart';
import 'package:filter_x/features/device/data/models/device_model.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/presentation/widgets/device_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/radius_values.dart';

class DeviceScreen extends StatefulWidget {
  DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final db = FirebaseFirestore.instance;

  final List<DeviceEntity> devices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final d = db.doc('device').get().then((value) => print(value));

          // db.collection("device").where("NOS", isEqualTo: 7).get().then(
          //   (querySnapshot) {
          //     print("Successfully completed");
          //     for (var docSnapshot in querySnapshot.docs) {
          //       print('${docSnapshot.id} => ${docSnapshot.data()}');
          //     }
          //   },
          //   onError: (e) => print("Error completing: $e"),
          // );

          final devicesFromFirebase = await db.collection('device').get();
          devices.clear();
          for (var i = 0; i < devicesFromFirebase.docs.length; i++) {
            devices.add(
              DeviceModel.fromJson(
                idFromCloudFireStore: devicesFromFirebase.docs[i].id,
                json: devicesFromFirebase.docs[i].data(),
              ),
            );
          }

          print(devices);

          setState(() {});

          // db.collection('device').get().then(
          //   (value) {
          //     print(value.docs[0].data()['name']);
          //   },
          //   onError: (e) => debugPrint(e.toString()),
          // );
        },
        child: Icon(Icons.add),
      ),
      body: ConditionalBuilder(
        fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        condition: devices.isNotEmpty,
        builder: (context) => Padding(
          padding: EdgeInsetsDirectional.only(
            top: context.height * 0.1,
            start: 20,
            end: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppStrings.deviceListNameText,
                        style: context.textList.displayLarge!.copyWith(
                          fontFamily: 'customArabic',
                          // fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => DeviceItem(
                    device: devices[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: devices.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
