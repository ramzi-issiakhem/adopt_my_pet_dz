import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetWorkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetWorkInfoImpl({@required this.dataConnectionChecker});

  @override
  Future<bool> isConnected() async {
    return await dataConnectionChecker.hasConnection;
  }
}
