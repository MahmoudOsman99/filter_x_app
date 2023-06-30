import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure implements Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class OfflineFailure implements Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
