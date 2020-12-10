part of 'getlostanimals_bloc.dart';

abstract class GetlostanimalsEvent extends Equatable {
  GetlostanimalsEvent();

  @override
  List<Object> get props => [];
}

class GetLostAnimals extends GetlostanimalsEvent {
  final List<dynamic> documentList;

  GetLostAnimals({this.documentList});
}
