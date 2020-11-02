import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes().call(context),
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MainAppBar().call(context)),
        body: Column(
          children: [Text("profile")],
        ),
      ),
    );
  }
}
