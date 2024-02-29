import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkBaseInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get internetConnectionStream;
}

class NetworkInfo implements NetworkBaseInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get internetConnectionStream {
    return connectionChecker.onStatusChange;
  }
}
