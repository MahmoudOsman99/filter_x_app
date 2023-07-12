import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:filter_x/config/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/shared/images_path.dart';
import 'package:filter_x/core/shared/app_constants_value.dart';
import 'package:filter_x/core/shared_widgets/default_button.dart';
import 'package:filter_x/core/shared_widgets/default_text_form_field.dart';
import 'package:filter_x/features/device/data/models/device_model.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/presentation/widgets/device_item.dart';
import 'package:flutter/material.dart';

class DeviceDetails extends StatefulWidget {
  final DeviceEntity device;
  DeviceDetails({
    super.key,
    required this.device,
  });

  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  final formKey = GlobalKey<FormState>();

  //! Text fields controllers
  final nameController = TextEditingController();

  final NOSController = TextEditingController();

  final hasWarrantyController = TextEditingController();

  final NOWIfExistsController = TextEditingController();

  final db = FirebaseFirestore.instance;

  bool setDataToModelFromControllers() {
    widget.device.name = nameController.text;
    widget.device.NOS = int.parse(NOSController.text);
    if (widget.device.hasWarranty) {
      if (int.parse(NOWIfExistsController.text) <= 0) {
        return false;
      }
    }
    widget.device.NOWIfExistInMonth = int.parse(NOWIfExistsController.text);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.device.name;
    NOSController.text = widget.device.NOS.toString();
    hasWarrantyController.text = widget.device.hasWarranty
        ? AppStrings.yesTextArabic
        : AppStrings.noTextArabic;
    NOWIfExistsController.text = widget.device.NOWIfExistInMonth.toString();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            bottom: 20,
            end: 20,
            start: 20,
            top: 20,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    Text(
                      widget.device.name,
                      style: context.textList.displayLarge!.copyWith(
                        fontFamily: 'customArabic',
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 100,
                    //   backgroundImage: AssetImage(deviceImagePath),
                    // )
                    DeviceItem(device: widget.device),
                    SizedBox(
                      height: context.height * 0.08,
                    ),
                    SizedBox(
                      // height: context.height * 0.6,
                      width: context.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppConstantsValues.borderRadiusValue15),
                          color: AppColors.lightOrangeColor,
                          border: Border.all(
                            color: AppColors.orangeColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(AppConstantsValues.paddingValue20),
                          child: Column(
                            children: [
                              Text(
                                AppStrings.deviceEditInformationTextArabic,
                              ),
                              SizedBox(
                                height: context.height * 0.01,
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    DefaultTextFormField(
                                      controller: nameController,
                                      lable: AppStrings.deviceNameTextArabic,
                                      validator: validator,
                                    ),

                                    DefaultTextFormField(
                                      controller: NOSController,
                                      lable: AppStrings.deviceNOSTextArabic,
                                      keyboardType: const TextInputType
                                          .numberWithOptions(),
                                      validator: validator,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppStrings
                                              .deviceHasWarrantyTextArabic,
                                          style: context.textList.bodyMedium,
                                        ),
                                        Switch(
                                          // This bool value toggles the switch.
                                          value: widget.device.hasWarranty,

                                          activeColor: Colors.green,
                                          onChanged: (bool value) {
                                            // This is called when the user toggles the switch.
                                            // widget.device.hasWarranty = value;
                                            setState(() {
                                              widget.device.hasWarranty = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    // DefaultTextFormField(
                                    //   controller: hasWarrantyController,
                                    //   lable: AppStrings.deviceHasWarrantyText,
                                    // ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    DefaultTextFormField(
                                      controller: NOWIfExistsController,
                                      lable: AppStrings
                                          .deviceNOWIfExistInMonthTextArabic,
                                      validator: validator,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.02,
                                    ),
                                    DefualtButton(
                                      text: AppStrings.saveTextArabic,
                                      onPressed: () {
                                        if (formKey.currentState!.validate() &&
                                            setDataToModelFromControllers()) {
                                          db
                                              .collection(CollectionsNames
                                                  .deviceCollectionFirebaseNameText)
                                              .doc(widget.device.ID)
                                              .update(
                                                DeviceModel.toJson(
                                                  widget.device,
                                                ),
                                              )
                                              .then((value) {
                                            print('updated');
                                          }).catchError((error) =>
                                                  print(error.toString()));
                                        } else {}
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validator(String? value) {
  if (value!.trim().isEmpty) return AppStrings.requiredFieldTextArabic;
  return null;
}
