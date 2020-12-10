import 'dart:async';

import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_animal_enity.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'getlostanimals_event.dart';
part 'getlostanimals_state.dart';

class GetlostanimalsBloc
    extends Bloc<GetlostanimalsEvent, GetlostanimalsState> {
  GetlostanimalsBloc() : super(Empty());

  @override
  Stream<GetlostanimalsState> mapEventToState(
    GetlostanimalsEvent event,
  ) async* {
    if (event is GetLostAnimals) {
      yield Loading();
      List<LostAnimalEntity> list = [];

      List<DocumentSnapshot> documents = event.documentList;
      documents.forEach((element) {
        Map map = element.get('position');
        GeoPoint point = map['geopoint'];

        list.add(LostAnimalEntity(
            shortDescription: element.get("shortDescription"),
            description: element.get("shortDescription"),
            name: element.get("name"),
            position: LatLng(point.latitude, point.longitude),
            imageUrl: element.get("imageUrl")));
      });

      yield Loaded(list);
    }
  }
}
