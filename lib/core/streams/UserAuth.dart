import 'dart:async';

import 'package:adopt_my_pet_dz/features/Authentication/data/models/UserObjectModel.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  final auth = FirebaseAuth.instance;
  final StreamController<UserObject> controller =
      StreamController<UserObject>();

  UserAuth() {
    auth.authStateChanges().listen((User user) {
      if (user == null) {
        controller.add(null);
      } else {
        UserObject userObject = UserObjectModel.fromFireBaseUser(user);
        controller.add(userObject);
      }
    });
  }
}
