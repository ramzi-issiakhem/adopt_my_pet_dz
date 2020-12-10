import 'package:adopt_my_pet_dz/features/Authentication/data/models/UserObjectModel.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:firebase_auth/firebase_auth.dart';

UserObject currentUser =
    UserObjectModel.fromFireBaseUser(FirebaseAuth.instance.currentUser);
