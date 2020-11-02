part of 'isloggedin_bloc.dart';

abstract class IsloggedinState extends Equatable {
  IsloggedinState();
  @override
  List<Object> get props => [];
}

class Empty extends IsloggedinState {}

class Loading extends IsloggedinState {}

class Error extends IsloggedinState {
  final String message;

  Error({this.message});
}

class Loaded extends IsloggedinState {
  final bool state;

  Loaded({@required this.state});
}
