import 'package:filter_x/core/Strings/app_colors.dart';
import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/core/Strings/app_strings.dart';
import 'package:filter_x/core/shared/app_constants_value.dart';
import 'package:filter_x/features/installments/presentation/bloc/installments_bloc.dart';
import 'package:filter_x/features/installments/presentation/widgets/installment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentsScreen extends StatelessWidget {
  const InstallmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.installListTextArabic,
          style: context.textList.bodyMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.coffeColor,
      body: BlocConsumer<InstallmentsBloc, InstallmentsState>(
        listener: (context, state) {
          print(state.runtimeType);
        },
        builder: (context, state) {
          if (state is InstallmentLoadedSuccessfullyState) {
            return InstallmentItemWidget(
              install: state.installemnt[0],
            );
          }
          //  else if (state is InstallmentAddSuccessfullyState) {
          //   return Scaffold(
          //     body: Center(
          //       child: Text(
          //         'Installment Added',
          //         style: context.textList.displayLarge,
          //       ),
          //     ),
          //   );
          // }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
