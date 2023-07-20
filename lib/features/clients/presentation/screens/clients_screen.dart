import 'package:filter_x/features/clients/presentation/bloc/clients_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientsBloc, ClientsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(),
        );
      },
    );
  }
}
