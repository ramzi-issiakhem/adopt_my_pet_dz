import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserObject extends Equatable {
  String username;
  final String uid;
  String email;
  String photoUrl;
  bool emailVerified;

  UserObject({
    @required this.uid,
    @required this.email,
    @required this.username,
    @required this.photoUrl,
    @required this.emailVerified,
  }) : super([uid, email, username, photoUrl, emailVerified]);
}
