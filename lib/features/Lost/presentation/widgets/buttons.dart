import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/widgets/borders.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  String text;
  Function onTap;
  Color color;
  BuildButton({this.text, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    double radiusAmount = 8;
    double font;
    if (text.characters.length >= 16) {
      font = 8;
    } else if (text.characters.length < 16) {
      font = 10;
    }

    return Container(
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: BuildBorder(width: 0.5),
          borderRadius: BuildBorderRadius(type: "all", radius: radiusAmount)),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusAmount),
        ),
        padding: EdgeInsets.all(0),
        onPressed: onTap,
        color: color,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: font,
              fontFamily: "Impact"),
        ),
      ),
    );
  }
}

class LargeButtons extends StatelessWidget {
  String text;
  Function onPressedFunction;
  /**
   *  LargeButtonsByDefault
   */
  LargeButtons({this.onPressedFunction, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: mainColor,
        height: globalSizeClass.containerHeight,
        width: globalSizeClass.containerWidth,
        child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressedFunction,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ));
  }
}
