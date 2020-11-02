part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  RegisterState();

  @override
  List<Object> get props => [];
}

class Empty extends RegisterState {}

class Loading extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;
  final String email;
  final String displayName;
  RegisterError({this.displayName, this.email, this.message});
}

class Error extends RegisterState {
  final String message;

  Error({this.message});
}

class Loaded extends RegisterState {
  final UserObject userObject;

  Loaded({@required this.userObject});
}
