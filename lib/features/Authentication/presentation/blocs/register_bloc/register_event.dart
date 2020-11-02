part of 'register_bloc.dart';

abstract class RegisterBlocEvent extends Equatable {
  RegisterBlocEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends RegisterBlocEvent {
  final String email;
  final String password;
  final String displayName;

  RegisterEvent(
      {@required this.email,
      @required this.password,
      @required this.displayName});
}
