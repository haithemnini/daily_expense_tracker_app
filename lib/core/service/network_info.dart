import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfoBase {
  Future<bool> get isConnected;
}

class NetworkInfo implements NetworkInfoBase {
  final InternetConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
