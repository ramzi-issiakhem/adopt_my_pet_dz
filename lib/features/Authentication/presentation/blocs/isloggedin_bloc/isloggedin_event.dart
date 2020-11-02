part of 'isloggedin_bloc.dart';

abstract class IsloggedinEvent extends Equatable {
  IsloggedinEvent() : super();

  @override
  List<Object> get props => [];
}

class IsLoggedInEvent extends IsloggedinEvent {}
