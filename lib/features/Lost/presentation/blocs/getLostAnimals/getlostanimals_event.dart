part of 'getlostanimals_bloc.dart';

abstract class GetlostanimalsEvent extends Equatable {
  GetlostanimalsEvent();

  @override
  List<Object> get props => [];
}

class GetLostAnimals extends GetlostanimalsEvent {
  final List<DocumentSnapshot> documentList;

  GetLostAnimals({this.documentList});
}
