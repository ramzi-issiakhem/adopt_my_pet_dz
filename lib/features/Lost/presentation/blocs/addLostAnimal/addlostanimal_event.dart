part of 'addlostanimal_bloc.dart';

abstract class AddlostanimalEvent extends Equatable {
  AddlostanimalEvent();

  @override
  List<Object> get props => [];
}

class AddLostAnimal extends AddlostanimalEvent {
  final String description;
  final String shortDescription;
  final String imageUrl;
  final LatLng position;
  final String name;

  AddLostAnimal(
      {this.description,
      this.shortDescription,
      this.imageUrl,
      this.position,
      this.name});
}
