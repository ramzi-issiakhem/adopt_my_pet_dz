import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:flutter/material.dart';

BorderRadius BuildBorderRadius({String type, double radius = 0}) {
  switch (type) {
    case "top":
      return BorderRadius.only(
        topLeft: Radius.circular(
            globalSizeClass.upperCardNearestLostAnimalHeight / 4.5),
        topRight: Radius.circular(
            globalSizeClass.upperCardNearestLostAnimalHeight / 4.5),
      );
      break;
    case "bottom":
      return BorderRadius.only(
        bottomLeft: Radius.circular(
            globalSizeClass.upperCardNearestLostAnimalHeight / 4.5),
        bottomRight: Radius.circular(
            globalSizeClass.upperCardNearestLostAnimalHeight / 4.5),
      );
      break;
    default:
      return BorderRadius.all(Radius.circular(radius));
  }
}

Border BuildBorder({double width = 0.8}) {
  return Border.all(
    color: Colors.black,
    width: width,
  );
}
