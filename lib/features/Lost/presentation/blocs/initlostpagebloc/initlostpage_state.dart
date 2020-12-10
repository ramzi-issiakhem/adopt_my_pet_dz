part of 'initlostpage_bloc.dart';

abstract class InitlostpageState extends Equatable {
  InitlostpageState();

  @override
  List<Object> get props => [];
}

class Empty extends InitlostpageState {}

class Loading extends InitlostpageState {}

class Error extends InitlostpageState {
  final String message;
  Error({this.message});
}

class Loaded extends InitlostpageState {
  LostEntity data;
  Loaded({this.data});
}
