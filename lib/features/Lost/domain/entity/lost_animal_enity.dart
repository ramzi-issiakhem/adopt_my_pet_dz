import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LostAnimalEntity extends Equatable {
  final String name;
  final String imageUrl;
  final LatLng position;
  final String shortDescription;
  final String description;

  LostAnimalEntity(
      {this.shortDescription,
      this.name,
      this.imageUrl,
      this.position,
      this.description});
}
