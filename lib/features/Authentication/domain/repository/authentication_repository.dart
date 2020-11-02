import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationRepository {
  /// Return Either the user is loggedIn ( connected)
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, bool>> isLoggedIn();

  /// Return The Sign In UserObject if the credentials are right
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, UserObject>> loggingIn(
      {String email, String password});

  /// Return The Register UserObject
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, UserObject>> register(
      {@required String email,
      @required String password,
      @required String displayName});
}
