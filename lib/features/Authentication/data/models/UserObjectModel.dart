import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

// ignore: must_be_immutable
class UserObjectModel extends UserObject {
  UserObjectModel({
    @required String username,
    @required String uid,
    @required String email,
    @required String photoUrl,
    @required bool emailVerified,
  }) : super(
            username: username,
            uid: uid,
            email: email,
            emailVerified: emailVerified,
            photoUrl: photoUrl);

  factory UserObjectModel.fromFireBaseUser(User firebaseUser) {
    var email = firebaseUser.email;
    var uid = firebaseUser.uid;
    var photoUrl = firebaseUser.photoURL;
    var username = firebaseUser.displayName;
    var emailVerified = firebaseUser.emailVerified;

    if (email == null ||
        uid == null ||
        username == null ||
        email == null ||
        photoUrl == null) {
      return null;
    }

    return UserObjectModel(
        email: email,
        uid: uid,
        emailVerified: emailVerified,
        photoUrl: photoUrl,
        username: username);
  }
}
