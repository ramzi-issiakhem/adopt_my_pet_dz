part of 'loggingin_bloc.dart';

abstract class LogginginState extends Equatable {
  LogginginState();

  @override
  List<Object> get props => [];
}

class Empty extends LogginginState {}

class Loading extends LogginginState {}

class Loaded extends LogginginState {
  final UserObject user;
  Loaded({this.user});
}

class LoggingError extends LogginginState {
  final String message;
  final String email;
  LoggingError({this.email, this.message});
}

class Error extends LogginginState {
  final String message;

  Error({@required this.message});
}
