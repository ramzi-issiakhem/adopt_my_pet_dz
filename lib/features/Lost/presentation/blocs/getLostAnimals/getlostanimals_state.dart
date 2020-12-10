part of 'getlostanimals_bloc.dart';

abstract class GetlostanimalsState extends Equatable {
  GetlostanimalsState();

  @override
  List<Object> get props => [];
}

class Empty extends GetlostanimalsState {}

class Loading extends GetlostanimalsState {}

class Error extends GetlostanimalsState {
  final String message;

  Error(this.message);
}

class Loaded extends GetlostanimalsState {
  final List<LostAnimalEntity> list;

  Loaded(this.list);
}
