import 'package:equatable/equatable.dart';
import 'package:filter_x/features/device/domain/entities/product_entity.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class DeviceInitialEvent extends DeviceEvent {}

class GetAllDeviceEvent extends DeviceEvent {}

class DeviceLoadedEvent extends DeviceEvent {
  final List<Product> products;

  const DeviceLoadedEvent(this.products);
  @override
  List<Object> get props => [products];
}

class AddProductEvent extends DeviceEvent {}
