import 'package:flutter/material.dart';

ConstantSizes globalSizeClass = ConstantSizes();

class ConstantSizes {
  var deviceData;
  var sizeH;
  var sizeW;
  double heightBottomNavBar = 55;
  double heightTopNavBar = 55;
  double sizeCatLostMainImage;
  double containerHeight;
  double containerWidth;
  double upperCardNearestLostAnimalWidth;
  double upperCardNearestLostAnimalHeight;
  double bottomCardNearestLostAnimalWidth;
  double bottomCardNearestLostAnimalHeight;
  double bottomButtonCardLostAnimalheight;

  ConstantSizes({this.deviceData});

  void recalcuate(MediaQueryData _deviceData) {
    this.deviceData = _deviceData;

    sizeH = (deviceData.size).height;
    sizeW = (deviceData.size).width;
    heightBottomNavBar = sizeH * 0.06;
    heightTopNavBar = sizeH * 0.08;
    sizeCatLostMainImage = sizeH * 0.45;
    containerHeight = sizeH * 0.068;
    containerWidth = sizeW * 0.88;
    upperCardNearestLostAnimalHeight = sizeH * 0.12;
    upperCardNearestLostAnimalWidth = sizeW * 0.28;
    bottomCardNearestLostAnimalWidth = sizeW * 0.28;
    bottomButtonCardLostAnimalheight = sizeH * 0.025;
    bottomCardNearestLostAnimalHeight = (3 * bottomButtonCardLostAnimalheight);
  }
}
