part of 'installments_bloc.dart';

abstract class InstallmentsState extends Equatable {
  const InstallmentsState();

  @override
  List<Object> get props => [];
}

class InstallmentsInitialState extends InstallmentsState {}

class InstallmentLoadingState extends InstallmentsState {}

class InstallmentLoadedSuccessfullyState extends InstallmentsState {
  final List<Installment> installemnt;

  const InstallmentLoadedSuccessfullyState({required this.installemnt});
}

class InstallmentErrorState extends InstallmentsState {
  final String error;

  const InstallmentErrorState({required this.error});
}

class InstallmentAddSuccessfullyState extends InstallmentsState {}

class InstallmentAddErrorState extends InstallmentsState {
  final String error;

  const InstallmentAddErrorState({required this.error});
}
