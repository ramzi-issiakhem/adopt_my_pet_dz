import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:flutter/material.dart';

Container bottomNavBar(BuildContext context) {
  globalSizeClass.recalcuate(MediaQuery.of(context));
  return Container(
    height: globalSizeClass.heightBottomNavBar,
    color: mainColor,
    child: TabBar(
      isScrollable: false,
      labelColor: Colors.green,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: mainColor,
      tabs: <Widget>[
        //! Lost Animal
        tabs(icon: Icons.priority_high),
        //_betweenTabs(),

        //! Search for an animal
        tabs(icon: Icons.search, size: 34),
        //_betweenTabs(),

        //! Add an Adoption
        tabs(icon: Icons.add, size: 43),
        //_betweenTabs(),

        //! Inverstor
        tabs(icon: Icons.help, size: 35),
        //_betweenTabs(),

        //! Profile
        tabs(icon: Icons.person, size: 40),
        //_betweenTabs(),
      ],
    ),
  );
}

Widget _betweenTabs() {
  return Row(
    children: [
      SizedBox(
        width: 20,
      ),
      VerticalDivider(color: Colors.white, width: 10),
      SizedBox(
        width: 20,
      ),
    ],
  );
}

Tab tabs({IconData icon, double size = 30}) {
  return Tab(
    icon: Icon(
      icon,
      color: Colors.white,
      size: size,
    ),
  );
}
