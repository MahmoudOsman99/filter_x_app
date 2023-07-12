import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get hasConnection;
}

class NetworkInfoWithConnectionCheckerImpl implements NetworkInfo {
  final InternetConnection connectionChecker;
  NetworkInfoWithConnectionCheckerImpl(this.connectionChecker);

  @override
  Future<bool> get hasConnection async =>
      await connectionChecker.hasInternetAccess;
}
