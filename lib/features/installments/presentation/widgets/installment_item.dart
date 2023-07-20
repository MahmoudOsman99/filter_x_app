import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/router_settings/routes.dart';
import 'package:filter_x/features/installments/domain/entities/installment_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/Strings/app_colors.dart';
import '../../../../core/shared/app_constants_value.dart';

class InstallmentItemWidget extends StatelessWidget {
  final Installment install;

  const InstallmentItemWidget({
    super.key,
    required this.install,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(maxHeight: constraints.maxHeight),
          child: SingleChildScrollView(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: AppColors.lightCoffeColor,
                  borderRadius: BorderRadius.circular(
                    AppConstantsValues.borderRadiusValue25,
                  )),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          BuidInstallRowWidget(
                            firstText: AppStrings.clientNameTextArabic,
                            secondText: install.client.name,
                            // secondText: 'install.client',
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.productSingleRoute,
                                arguments: install.product,
                              );
                            },
                            child: BuidInstallRowWidget(
                              firstText: AppStrings.deviceNameTextArabic,
                              secondText: install.product.name,
                            ),
                          ),
                          BuidInstallRowWidget(
                            firstText:
                                AppStrings.clientDateOfContractTextArabic,
                            secondText: DateFormat('dd-MM-yyyy')
                                .format(install.dateContract),
                          ),
                          BuidInstallRowWidget(
                            firstText: AppStrings.installTotalPriceTextArabic,
                            secondText: install.totalPrice,
                          ),
                          BuidInstallRowWidget(
                            firstText: AppStrings.installPaidTextArabic,
                            secondText: install.paid,
                          ),
                          BuidInstallRowWidget(
                            firstText: AppStrings.installRemainingTextArabic,
                            secondText: install.remaining,
                          ),
                          BuidInstallRowWidget(
                            firstText: AppStrings.installNOMTextArabic,
                            secondText: install.numberOfMonths,
                          ),
                          BuidInstallRowWidget(
                            firstText:
                                AppStrings.installMonthlyInstallmentTextArabic,
                            secondText: install.monthlyMoney,
                          ),
                          BuidInstallRowWidget(
                            firstText:
                                AppStrings.installremainingToFinishTextArabic,
                            secondText: install.remainingToFinish,
                          ),
                          BuidInstallRowWidget(
                            firstText: AppStrings.installIsActiveTextArabic,
                            secondText: install.isActive
                                ? AppStrings.yesTextArabic
                                : AppStrings.noTextArabic,
                          ),
                          BuidInstallRowWidget(
                            firstText:
                                AppStrings.installTechnicianNameTextArabic,
                            secondText: install.employee.name,
                            // secondText: '',
                          ),
                          BuidInstallRowWidget(
                            firstText: AppStrings.notesTextArabic,
                            secondText:
                                '${install.notes} -- ddsdsvdsvdsvdsvvdsvewge6516ew1g6ewg984ewg581ew1gew15g1ew5171gfew4784efw784ew87f4ew74fds7474874',
                          ),
                        ],
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

class BuidInstallRowWidget extends StatelessWidget {
  final String firstText;
  final dynamic secondText;

  const BuidInstallRowWidget({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(firstText),
            Expanded(
              child: Text(
                '$secondText',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 3,
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }
}
