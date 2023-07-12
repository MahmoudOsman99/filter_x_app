part of 'installments_bloc.dart';

abstract class InstallmentsEvent extends Equatable {
  const InstallmentsEvent();

  @override
  List<Object> get props => [];
}

class GetAllInstallmentsEvent extends InstallmentsEvent {
  @override
  List<Object> get props => [];
}

class AddInstallmentEvent extends InstallmentsEvent {
  final Installment? installment;

  const AddInstallmentEvent({this.installment});
  // final Installment installment;

  // const AddInstallmentEvent({required this.installment});
  // @override
  // List<Object> get props => [installment];
}

class UpdateInstallmentEvent extends InstallmentsEvent {
  final Installment installment;

  const UpdateInstallmentEvent({required this.installment});
  @override
  List<Object> get props => [installment];
}

class DeleteInstallmentEvent extends InstallmentsEvent {
  final String installmentID;

  const DeleteInstallmentEvent({required this.installmentID});
  @override
  List<Object> get props => [installmentID];
}
