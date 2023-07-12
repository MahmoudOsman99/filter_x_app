import 'package:filter_x/config/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/shared/app_constants_value.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeInfoCard extends StatelessWidget {
  final String text;
  final Icon? icon;

  const EmployeeInfoCard({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // return DecoratedBox(
    //   decoration: BoxDecoration(
    //     color: AppColors.yellowColor.withOpacity(0.5),
    //     borderRadius: BorderRadius.circular(
    //       AppConstantsValues.borderRadiusValue15 + 15,
    //     ),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsetsDirectional.only(
    //       start: 10,
    //       end: 10,
    //       top: 10,
    //       bottom: 10,
    //     ),
    //     child: SizedBox(
    //       height: 70,
    //       width: 70,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Icon(
    //             Icons.calendar_month_outlined,
    //             size: 30,
    //           ),
    //           Text(
    //             text,
    //             // DateFormat('yyyy - MMMM').format(technicians[0].dateOfHiring),
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,
    //             style: context.textList.labelSmall,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );`
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.yellowColor.withOpacity(0.15),
        borderRadius:
            BorderRadius.circular(AppConstantsValues.borderRadiusValue15),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppConstantsValues.roundedRadiusValue100,
                ),
                color: AppColors.yellowColor,
              ),
              child: icon,
            ),
          ),
          Spacer(),
          Text(
            text,
            style: context.textList.bodyMedium,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
