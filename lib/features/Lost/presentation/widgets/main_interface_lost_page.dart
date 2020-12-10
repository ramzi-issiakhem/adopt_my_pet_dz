import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_animal_enity.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/widgets/borders.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateColumnBody extends StatefulWidget {
  GoogleMapController controller;

  List<LostAnimalEntity> list;
  LostEntity lostEntity;

  CreateColumnBody(this.list, this.lostEntity);

  @override
  _CreateColumnBodyState createState() => _CreateColumnBodyState(lostEntity);
}

class _CreateColumnBodyState extends State<CreateColumnBody> {
  LostEntity lostEntity;
  _CreateColumnBodyState(this.lostEntity);

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller = controller;
    });
  }

  Set<Marker> _getMarkers(List<LostAnimalEntity> nearestAnimalsList) {
    Set<Marker> markers = {};
    if (nearestAnimalsList.isNotEmpty) {
      nearestAnimalsList.forEach((element) {
        var marker = Marker(
          position: element.position,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: element.name,
            snippet: element.shortDescription,
          ),
          markerId: MarkerId(element.name.toString()),
        );
        markers.add(marker);
      });
      return markers;
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Animal Lost",
              style: TextStyle(
                fontFamily: "Impact",
                fontSize: 25,
              ),
            ),
            Text(
              "Near By You",
              style: TextStyle(
                fontFamily: "Trebuchet",
                fontSize: 14,
              ),
            )
          ],
        ),
        Divider(
          height: globalSizeClass.sizeH * 0.035,
          color: mainColor,
          thickness: 2,
        ),

        //! Cards List

        Container(
          height: globalSizeClass.upperCardNearestLostAnimalHeight +
              globalSizeClass.bottomCardNearestLostAnimalHeight +
              globalSizeClass.sizeH * 0.002,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB((globalSizeClass.sizeH * 0.01), 0,
                    globalSizeClass.sizeH * 0.008, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //! Upper Card (Animal Image)
                    Container(
                      width: globalSizeClass.upperCardNearestLostAnimalWidth,
                      height: globalSizeClass.upperCardNearestLostAnimalHeight,
                      decoration: BoxDecoration(
                          border: BuildBorder(),
                          borderRadius: BuildBorderRadius(type: "top")),
                      child: ClipRRect(
                        borderRadius: BuildBorderRadius(type: "top"),
                        child: Image.network(
                          widget.list[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //! Lower Card (Two Buttons)
                    Container(
                      height: globalSizeClass.bottomCardNearestLostAnimalHeight,
                      width: globalSizeClass.bottomCardNearestLostAnimalWidth,
                      decoration: BoxDecoration(
                        border: BuildBorder(),
                        borderRadius: BuildBorderRadius(type: "bottom"),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //! Information Button
                          SizedBox(
                            width: globalSizeClass
                                    .bottomCardNearestLostAnimalWidth *
                                0.85,
                            height: globalSizeClass
                                .bottomButtonCardLostAnimalheight,
                            child: BuildButton(
                                text: "Informations",
                                onTap: () {},
                                color: mainColor),
                          ),

                          //! Go To Button
                          SizedBox(
                            width: globalSizeClass
                                    .bottomCardNearestLostAnimalWidth *
                                0.85,
                            height: globalSizeClass
                                .bottomButtonCardLostAnimalheight,
                            child: BuildButton(
                                text: "Go To",
                                onTap: () {
                                  widget.controller.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                    target: widget.list[index].position,
                                    zoom: 15,
                                  )));
                                },
                                color: thirdColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(
          height: globalSizeClass.sizeH * 0.035,
          color: mainColor,
          thickness: 2,
        ),
        RaisedButton(
          onPressed: () async {
            var pos = await Geolocator.getLastKnownPosition();
            Geoflutterfire geo = Geoflutterfire();
            GeoFirePoint point =
                geo.point(latitude: pos.latitude, longitude: pos.longitude);

            await FirebaseFirestore.instance.collection("lost_animals").add({
              "description": "Test",
              "shortDescription": "Test",
              "imageUrl": "test",
              "position": point.data,
              "name": "Lola"
            });
          },
          child: Text('Plus'),
        ),
        Expanded(
          flex: 8,
          child: GoogleMap(
            markers: _getMarkers(widget.list),
            onMapCreated: (controller) => _onMapCreated(controller),
            initialCameraPosition: CameraPosition(
              target: lostEntity.userPos,
              zoom: 10,
            ),
            myLocationEnabled: true,
            mapType: MapType.normal,
          ),
        ),
      ]),
    );
  }
}
