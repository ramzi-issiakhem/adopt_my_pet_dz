part of 'loggingin_bloc.dart';

abstract class LogginginEvent extends Equatable {
  LogginginEvent();

  @override
  List<Object> get props => [];
}

class LoggingInEvent extends LogginginEvent {
  final String email;
  final String password;

  LoggingInEvent(this.email, this.password);
}
