import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filter_x/config/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/config/strings.dart';
import 'package:filter_x/features/device/data/models/device_model.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/presentation/bloc/device_bloc.dart';
import 'package:filter_x/features/device/presentation/bloc/device_event.dart';
import 'package:filter_x/features/device/presentation/widgets/device_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/radius_values.dart';

class DeviceScreen extends StatelessWidget {
  DeviceScreen({super.key});

  Future<void> onRefresh(context) async {
    BlocProvider.of<DeviceBloc>(context).getAllDevicesUsecase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
      // listener: (context, state) {},
      builder: (context, state) {
        if (state is DeviceLoadedState) {
          List<DeviceEntity> devices = state.devices;
          return Scaffold(
            body: Padding(
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
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
