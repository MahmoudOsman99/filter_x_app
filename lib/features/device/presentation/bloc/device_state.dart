part of 'device_bloc.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

class DeviceInitialState extends DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceLoadedState extends DeviceState {
  final List<DeviceEntity> devices;
  const DeviceLoadedState(this.devices);

  @override
  List<Object> get props => devices;
}

class DeviceErrorState extends DeviceState {
  final String error;
  const DeviceErrorState(this.error);
}
