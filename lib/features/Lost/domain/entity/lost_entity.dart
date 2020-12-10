import 'dart:async';

import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_animal_enity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LostEntity {
  LatLng userPos;
  List<LostAnimalEntity> nearestLostAnimalsList;
  Stream<List<DocumentSnapshot>> stream;
  LostEntity({this.userPos, this.stream, this.nearestLostAnimalsList});
}
