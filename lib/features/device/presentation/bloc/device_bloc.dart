import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'device_event.dart';

part 'device_state.dart';

class DeviceCubit extends Bloc<DeviceEvent, DeviceState> {
  DeviceCubit() : super(DeviceInitial());
}
