import 'package:flutter/material.dart';

class MainAppBar {
  AppBar call(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Color(0xFF36CEFF),
      title: InkWell(
        child: Row(
          children: [
            Icon(
              Icons.pets,
              color: Colors.white,
            ),
            Text(
              "Adopt My Pet",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onTap: () => Navigator.pushReplacementNamed(context, "/home"),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/user/profile");
          },
        )
      ],
    );
  }
}
