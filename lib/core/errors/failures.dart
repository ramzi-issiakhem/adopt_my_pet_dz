import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
abstract class Failure extends Equatable {
  final String message;
  String email;
  String displayName;

  Failure({this.message});
}

// ignore: must_be_immutable
class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message});
}

// ignore: must_be_immutable
class NoInternetConnectionFailure extends Failure {
  final String message;
  NoInternetConnectionFailure({this.message});
}

// ignore: must_be_immutable
class AuthenticationFailure extends Failure {
  final String message;
  AuthenticationFailure({this.message});
}

// ignore: must_be_immutable
class LoggingFailure extends Failure {
  final String message;
  final String email;

  LoggingFailure({@required this.message, @required this.email});
}

// ignore: must_be_immutable
class RegisterFailure extends Failure {
  final String message;
  final String email;
  final String displayName;

  RegisterFailure(
      {@required this.displayName,
      @required this.message,
      @required this.email});
}

// ignore: must_be_immutable
class UnknownFailure extends Failure {
  final String message;
  UnknownFailure({this.message});
}
