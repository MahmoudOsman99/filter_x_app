import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filter_x/config/strings.dart';
import 'package:filter_x/features/device/domain/entities/device_entity.dart';
import 'package:filter_x/features/device/domain/usecases/add_device_usecase.dart';
import 'package:filter_x/features/device/domain/usecases/delete_device_usecase.dart';
import 'package:filter_x/features/device/domain/usecases/get_all_devices_usecase.dart';

import '../../../../core/error/failures.dart';
import 'device_event.dart';

part 'device_state.dart';

// typedef Either<Failure, Unit>

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final AddDeviceUseCase addDeviceUsecase;
  final GetAllDevicesUseCase getAllDevicesUsecase;
  final DeleteDeviceUseCase deleteDeviceUsecase;

  DeviceBloc({
    required this.addDeviceUsecase,
    required this.getAllDevicesUsecase,
    required this.deleteDeviceUsecase,
  }) : super(DeviceInitialState()) {
    on<DeviceEvent>((event, emit) async {
      if (event is GetAllDeviceEvent) {
        emit(DeviceLoadingState());
        final failureOrDevices = await getAllDevicesUsecase();
        emit(_eitherStateOrFailure(failureOrDevices));
      }
    });
  }

  DeviceState _eitherStateOrFailure(
      Either<Failure, List<DeviceEntity>> either) {
    return either.fold(
        (failure) => DeviceErrorState(_mapFailureToMessage(failure)),
        (devices) => DeviceLoadedState(devices));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessageText;
      case OfflineFailure:
        return AppStrings.offlineFailureMessageText;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}

/** PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (posts) => LoadedPostsState(
        posts: posts,
      ),
    );
  } */