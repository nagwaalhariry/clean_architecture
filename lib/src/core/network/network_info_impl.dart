import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _checker = InternetConnection();

  @override
  Future<bool> get isConnected => _checker.hasInternetAccess;
}
