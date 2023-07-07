import 'package:equatable/equatable.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class DeviceInitialEvent extends DeviceEvent {}

class GetAllDeviceEvent extends DeviceEvent {}

class DeviceLoadingEvent extends DeviceEvent {}

class DeviceLoadedEvent extends DeviceEvent {}

class DeviceErrorEvent extends DeviceEvent {}
