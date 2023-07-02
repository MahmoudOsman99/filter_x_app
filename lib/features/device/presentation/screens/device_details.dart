import 'package:filter_x/config/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/config/strings.dart';
import 'package:filter_x/core/shared/images_path.dart';
import 'package:filter_x/core/shared/radius_values.dart';
import 'package:filter_x/core/shared_widgets/default_button.dart';
import 'package:filter_x/core/shared_widgets/default_text_form_field.dart';
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

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.device.name;
    NOSController.text = widget.device.NOS.toString();
    hasWarrantyController.text =
        widget.device.hasWarranty ? AppStrings.yesText : AppStrings.noText;
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  height: context.height * 0.55,
                  width: context.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadiusValue),
                      color: AppColors.lightOrangeColor,
                      border: Border.all(
                        color: AppColors.orangeColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(paddingValue),
                      child: Column(
                        children: [
                          Text(
                            AppStrings.deviceEditInformationText,
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
                                  lable: AppStrings.deviceNameText,
                                ),
                                DefaultTextFormField(
                                  controller: NOSController,
                                  lable: AppStrings.deviceNOSText,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.deviceHasWarrantyText,
                                      style: context.textList.bodyMedium,
                                    ),
                                    Switch(
                                        // This bool value toggles the switch.
                                        value: widget.device.hasWarranty,
                                        activeColor: Colors.green,
                                        onChanged: (bool value) {
                                          // This is called when the user toggles the switch.
                                          widget.device.hasWarranty = value;
                                          setState(() {});
                                        }),
                                  ],
                                ),
                                // DefaultTextFormField(
                                //   controller: hasWarrantyController,
                                //   lable: AppStrings.deviceHasWarrantyText,
                                // ),
                                DefaultTextFormField(
                                  controller: NOWIfExistsController,
                                  lable: AppStrings.deviceNOWIfExistInMonthText,
                                ),
                                SizedBox(
                                  height: context.height * 0.02,
                                ),
                                DefualtButton(
                                  text: AppStrings.saveText,
                                  onPressed: () {
                                    print(formKey.currentState!.validate());
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
