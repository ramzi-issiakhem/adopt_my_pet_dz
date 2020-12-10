import 'dart:async';

import 'package:adopt_my_pet_dz/core/errors/exceptions.dart';
import 'package:adopt_my_pet_dz/core/network/firestore.dart';
import 'package:adopt_my_pet_dz/features/Lost/data/models/lost_animal_model.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_animal_enity.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

abstract class LostRemoteDataSource {
  /// Retrieve the UserObjectModel from the FireBaseUser
  ///
  /// Throws a [ServerException] in any error case .
  Future<LostEntity> getLostEntity();
}

class LostRemoteDataSourceImpl implements LostRemoteDataSource {
  final Geoflutterfire geo;

  LostRemoteDataSourceImpl({this.geo});

  @override
  Future<LostEntity> getLostEntity() async {
    try {
      Position userLocation = await getLocation();

      Query collectionReference =
          FirebaseFirestore.instance.collection("lost_animals");
      String field = "position";

      GeoFirePoint center = geo.point(
          latitude: userLocation.latitude, longitude: userLocation.longitude);

      Stream<List<DocumentSnapshot>> stream = geo
          .collection(collectionRef: collectionReference)
          .within(center: center, radius: 500, field: field, strictMode: true);

      return LostEntity(
          userPos: LatLng(userLocation.latitude, userLocation.longitude),
          stream: stream);
    } on NoPermissionException catch (e) {
      throw NoPermissionException(e.string);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  try {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw NoPermissionException('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw NoPermissionException(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw NoPermissionException(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    try {
      var pos =
          await Geolocator.getCurrentPosition(timeLimit: Duration(seconds: 2));
      return pos;
    } on TimeoutException catch (e) {
      var pos = Geolocator.getLastKnownPosition();
      return pos;
    }
  } on NoPermissionException catch (e) {
    throw NoPermissionException(e.toString());
  }
}
