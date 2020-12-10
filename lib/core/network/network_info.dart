import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetWorkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;
  final StreamController<bool> controller = StreamController<bool>();

  NetWorkInfoImpl({@required this.dataConnectionChecker}) {
    dataConnectionChecker.onStatusChange.listen((DataConnectionStatus status) {
      bool state = _connectivityStatusfromResult(status);

      controller.add(state);
    });
  }

  // ignore: missing_return
  bool _connectivityStatusfromResult(DataConnectionStatus result) {
    switch (result) {
      case DataConnectionStatus.connected:
        return true;
        break;
      case DataConnectionStatus.disconnected:
        return false;
        break;
      default:
    }
  }

  @override
  Future<bool> isConnected() async {
    return await dataConnectionChecker.hasConnection;
  }
}
