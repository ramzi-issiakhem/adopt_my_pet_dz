import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:flutter/material.dart';

Widget containerInput(
    {@required IconData icon,
    @required TextFormField textfield,
    String helpTooltip = ""}) {
  return Container(
    height: globalSizeClass.containerHeight,
    width: globalSizeClass.containerWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(14),
      ),
      border: Border.all(
        width: 2.5,
        color: mainColor,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          margin: EdgeInsets.all(0),
          child: Icon(
            icon,
            color: secondColor,
          ),
        ),
        VerticalDivider(
          color: mainColor,
          thickness: 2,
        ),
        SizedBox(
          width: 2.5,
        ),

        // padding: EdgeInsets.only(top: 20),
        // margin: EdgeInsets.only(top: 20),

        Row(
          children: <Widget>[
            Container(
              height: globalSizeClass.containerHeight,
              width: globalSizeClass.containerWidth - (57 + 49),
              child: textfield,
            ),
            helpTooltip != ""
                ? Tooltip(
                    message: helpTooltip,
                    child: Icon(
                      Icons.help,
                      size: globalSizeClass.containerHeight,
                      semanticLabel: helpTooltip,
                      color: secondColor,
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    ),
  );
}
