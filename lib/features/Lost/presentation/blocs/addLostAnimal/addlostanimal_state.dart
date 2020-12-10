part of 'addlostanimal_bloc.dart';

abstract class AddlostanimalState extends Equatable {
  AddlostanimalState();

  @override
  List<Object> get props => [];
}

class Empty extends AddlostanimalState {}

class Loading extends AddlostanimalState {}

class Loaded extends AddlostanimalState {}

class Error extends AddlostanimalState {}
