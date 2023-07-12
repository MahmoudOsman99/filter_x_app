import 'package:filter_x/config/extensions/app_extensions.dart';
import 'package:filter_x/features/installments/presentation/bloc/installments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentsScreen extends StatelessWidget {
  const InstallmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstallmentsBloc, InstallmentsState>(
      listener: (context, state) {
        print(state.runtimeType);
      },
      builder: (context, state) {
        if (state is InstallmentLoadedSuccessfullyState) {
          return Scaffold(
            body: Center(
              child: Text(
                'Installments',
                style: context.textList.displayLarge,
              ),
            ),
          );
        } else if (state is InstallmentAddSuccessfullyState) {
          return Scaffold(
            body: Center(
              child: Text(
                'Installment Added',
                style: context.textList.displayLarge,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
