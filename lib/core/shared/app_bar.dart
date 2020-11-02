import 'package:adopt_my_pet_dz/main.dart';
import 'package:flutter/material.dart';

class MainAppBar {
  AppBar call(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.blue[400],
      title: InkWell(
        child: Row(
          children: [
            Icon(Icons.pets),
            Text("Adopt My Pet"),
          ],
        ),
        onTap: () => Navigator.pushReplacementNamed(context, "/home"),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, "/user/profile");
          },
        )
      ],
    );
  }
}
