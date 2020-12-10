import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/pages/found_page.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/pages/lost_page.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MainLostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //! TheCatImage
        Image.asset(
          "assets/app/orange_cat_lost_main.png",
          width: globalSizeClass.sizeCatLostMainImage,
          height: globalSizeClass.sizeCatLostMainImage,
        ),

        //!TheTwoButtons
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            LargeButtons(
                text: "I found an Animal",
                onPressedFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoundPage(),
                      ));
                }),
            LargeButtons(
                text: "I lost an Animal",
                onPressedFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LostPage(),
                      ));
                })
          ],
        )
      ],
    );
  }
}
