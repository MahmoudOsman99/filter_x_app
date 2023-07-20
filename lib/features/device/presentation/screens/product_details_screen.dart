import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:filter_x/core/Strings/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/Strings/collections_names.dart';
import 'package:filter_x/core/shared/images_path.dart';
import 'package:filter_x/core/shared/app_constants_value.dart';
import 'package:filter_x/core/shared_widgets/default_button.dart';
import 'package:filter_x/core/shared_widgets/default_text_form_field.dart';
import 'package:filter_x/features/device/data/models/product_model.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:filter_x/features/device/presentation/widgets/device_item.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final formKey = GlobalKey<FormState>();

  //! Text fields controllers
  final nameController = TextEditingController();

  final NOSController = TextEditingController();

  final hasWarrantyController = TextEditingController();

  final NOWIfExistsController = TextEditingController();

  final db = FirebaseFirestore.instance;

  bool setDataToModelFromControllers() {
    widget.product.name = nameController.text;
    widget.product.NOS = int.parse(NOSController.text);
    if (widget.product.hasWarranty) {
      if (int.parse(NOWIfExistsController.text) <= 0) {
        return false;
      }
    }
    widget.product.NOWIfExistInMonth = int.parse(NOWIfExistsController.text);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.product.name;
    NOSController.text = widget.product.NOS.toString();
    hasWarrantyController.text = widget.product.hasWarranty
        ? AppStrings.yesTextArabic
        : AppStrings.noTextArabic;
    NOWIfExistsController.text = widget.product.NOWIfExistInMonth.toString();

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
                      widget.product.name,
                      style: context.textList.displayLarge!.copyWith(
                        fontFamily: 'customArabic',
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 100,
                    //   backgroundImage: AssetImage(deviceImagePath),
                    // )
                    DeviceItem(product: widget.product),
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
                                          AppStrings.productQuantityTextArabic,
                                          style: context.textList.bodyMedium,
                                        ),
                                        Switch(
                                          // This bool value toggles the switch.
                                          value: widget.product.hasWarranty,

                                          activeColor: Colors.green,
                                          onChanged: (bool value) {
                                            // This is called when the user toggles the switch.
                                            // widget.device.hasWarranty = value;
                                            setState(() {
                                              widget.product.hasWarranty =
                                                  value;
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
                                                  .productsCollectionFirebaseNameText)
                                              .doc(widget.product.ID)
                                              .update(
                                                ProductModel.toJson(
                                                  widget.product,
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
