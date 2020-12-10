import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:adopt_my_pet_dz/features/Profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class routes {
  Map<String, Widget Function(BuildContext)> call(BuildContext context) {
    return {
      "/home": (context) => HomePage(),
      "/user/profile": (context) => ProfilePage(),
    };
  }
}
