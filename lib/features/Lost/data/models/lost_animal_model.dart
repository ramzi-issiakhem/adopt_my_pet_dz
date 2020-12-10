import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_animal_enity.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LostAnimalModel extends LostAnimalEntity {
  final String name;
  final String imageUrl;
  final LatLng position;
  final String shortDescription;
  final String description;

  LostAnimalModel(
      {this.shortDescription,
      this.name,
      this.imageUrl,
      this.position,
      this.description});

  factory LostAnimalModel.fromFireStoreCollection(Map<String, dynamic> map) {
    GeoFirePoint geo = map["position"];
    return LostAnimalModel(
      shortDescription: map["shortDescription"],
      name: map["name"],
      imageUrl: map["imageUrl"],
      position: LatLng(geo.latitude, geo.longitude),
      description: map["description"],
    );
  }
}
