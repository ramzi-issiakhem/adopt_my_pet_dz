import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  final String message;
  String email;
  String displayName;

  Failure({this.message});
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message});
}

class NoInternetConnectionFailure extends Failure {
  final String message;
  NoInternetConnectionFailure({this.message});
}

class AuthenticationFailure extends Failure {
  final String message;
  AuthenticationFailure({this.message});
}

class LoggingFailure extends Failure {
  final String message;
  final String email;

  LoggingFailure({@required this.message, @required this.email});
}

class RegisterFailure extends Failure {
  final String message;
  final String email;
  final String displayName;

  RegisterFailure(
      {@required this.displayName,
      @required this.message,
      @required this.email});
}

class UnknownFailure extends Failure {
  final String message;
  UnknownFailure({this.message});
}
