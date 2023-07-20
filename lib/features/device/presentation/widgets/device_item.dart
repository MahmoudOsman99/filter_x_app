import 'package:filter_x/core/Strings/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/router_settings/routes.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/images_path.dart';
import '../../../../core/shared/app_constants_value.dart';

class DeviceItem extends StatelessWidget {
  final Product product;
  const DeviceItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productSingleRoute,
          arguments: product,
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
              AppConstantsValues.borderRadiusValue15,
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
                      '${AppStrings.deviceNameTextArabic}: ${product.name}',
                      style: context.textList.bodyMedium,
                    ),
                    Text(
                      '${AppStrings.deviceNOSTextArabic}: ${product.NOS}',
                      style: context.textList.bodyMedium,
                    ),
                    Text(
                      '${AppStrings.deviceHasWarrantyTextArabic}: ${product.hasWarranty == true ? AppStrings.yesTextArabic : AppStrings.noTextArabic}',
                      style: context.textList.bodyMedium,
                    ),
                    Text(
                      '${AppStrings.productQuantityTextArabic}: ${product.productCount}',
                      style: context.textList.bodyMedium,
                    ),
                    product.hasWarranty
                        ? Text(
                            '${AppStrings.deviceNOWIfExistInMonthTextArabic}: ${product.NOWIfExistInMonth}',
                            style: context.textList.bodyMedium,
                          )
                        : SizedBox(),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppConstantsValues.borderRadiusValue15,
                  ), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(context.width * 0.15), // Image radius
                    child: Image.asset(
                      AppAssets.deviceImagePath,
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
