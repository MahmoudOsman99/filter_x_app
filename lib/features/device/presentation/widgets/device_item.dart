import 'package:filter_x/config/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/config/strings.dart';
import 'package:filter_x/core/router_settings/routes.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/images_path.dart';
import '../../../../core/shared/radius_values.dart';

class DeviceItem extends StatelessWidget {
  final DeviceEntity device;
  const DeviceItem({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.singleDeviceRoute,
          arguments: device,
        );
        // print(device);
      },
      child: SizedBox(
        height: context.height / 5,
        width: context.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.lightOrangeColor,
            border: Border.all(
              color: AppColors.orangeColor,
            ),
            borderRadius: BorderRadius.circular(
              borderRadiusValue,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppStrings.deviceNameText}: ${device.name}',
                      style: context.textList.bodyMedium,
                    ),
                    Text(
                      '${AppStrings.deviceNOSText}: ${device.NOS}',
                      style: context.textList.bodyMedium,
                    ),
                    Text(
                      '${AppStrings.deviceHasWarrantyText}: ${device.hasWarranty == true ? AppStrings.yesText : AppStrings.noText}',
                      style: context.textList.bodyMedium,
                    ),
                    device.hasWarranty
                        ? Text(
                            '${AppStrings.deviceNOWIfExistInMonthText}: ${device.NOWIfExistInMonth}',
                            style: context.textList.bodyMedium,
                          )
                        : SizedBox(),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    borderRadiusValue,
                  ), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(context.width * 0.15), // Image radius
                    child: Image.asset(
                      deviceImagePath,
                      fit: BoxFit.cover,
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
