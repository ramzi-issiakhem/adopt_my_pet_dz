import 'package:adopt_my_pet_dz/core/errors/exceptions.dart';
import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/models/UserObjectModel.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationRemoteDataSource {
  /// Verify either the user is connected or No .
  ///
  /// Throws a [ServerException] in any error case .
  ///
  bool isConnected();

  /// Retrieve the UserObjectModel from the FireBaseUser
  ///
  /// Throws a [ServerException] in any error case .
  UserObjectModel getUser();

  /// Loggin In The User and return the UserObject
  ///
  /// Throws a [ServerException] in any error case .
  Future<UserObject> logginIn({String email, String password});

  /// Register a new User and return the UserObject
  ///
  /// Throws a [ServerException] in any error case .
  Future<UserObject> createUser(
      {@required String email,
      @required String password,
      @required String displayName});
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final FirebaseAuth fireBaseAuth;

  AuthenticationRemoteDataSourceImpl({@required this.fireBaseAuth});

  @override
  UserObjectModel getUser() {
    try {
      final fireBaseUser = fireBaseAuth.currentUser;
      return UserObjectModel.fromFireBaseUser(fireBaseUser);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  bool isConnected() {
    try {
      final fireBaseUser = fireBaseAuth.currentUser;

      if (fireBaseUser == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw ServerException("Servor Error");
    }
  }

  @override
  Future<UserObject> logginIn({String email, String password}) async {
    try {
      var result = await fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserObjectModel.fromFireBaseUser(result.user);
    } on FirebaseAuthException catch (error) {
      throw LoginException(error.code);
    } catch (error) {
      throw ServerException(error.toString());
    }
    ;
  }

  Future<UserObject> createUser(
      {String email, String password, String displayName}) async {
    try {
      var result = await fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;
      await result.user
          .updateProfile(displayName: displayName, photoURL: "default");
      return UserObjectModel.fromFireBaseUser(result.user);
    } on FirebaseAuthException catch (error) {
      throw RegisterException(error.code);
    } catch (error) {
      throw ServerException(error.toString());
    }
    ;
  }
}
