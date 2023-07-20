import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'installment_history_event.dart';
part 'installment_history_state.dart';

class InstallmentHistoryBloc extends Bloc<InstallmentHistoryEvent, InstallmentHistoryState> {
  InstallmentHistoryBloc() : super(InstallmentHistoryInitial()) {
    on<InstallmentHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
