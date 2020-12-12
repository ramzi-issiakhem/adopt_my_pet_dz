import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:flutter/material.dart';

class LostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
          child: MainAppBar().call(context),
        ),
        body: BuildBody(),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
