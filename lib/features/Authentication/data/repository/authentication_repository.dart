import 'package:adopt_my_pet_dz/core/errors/exceptions.dart';
import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/core/network/network_info.dart';
import 'package:adopt_my_pet_dz/core/shared/shared.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/datasources/authentication_local_data_sources.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/datasources/authentication_remote_data_sources.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final AuthenticationLocalDataSource localDataSource;
  final NetworkInfo netWorkInfo;

  AuthenticationRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.netWorkInfo});

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    var isConnected = await netWorkInfo.isConnected();
    if (!isConnected) {
      return Left(NoInternetConnectionFailure(
          message: "Internet Connection Required ! "));
    }

    try {
      final isConnected = remoteDataSource.isConnected();
      return Right(isConnected);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserObject>> loggingIn(
      {String email, String password}) async {
    var isConnected = await netWorkInfo.isConnected();
    if (!isConnected) {
      return Left(NoInternetConnectionFailure(
          message: "Internet Connection Required ! "));
    }

    try {
      final userObject =
          await remoteDataSource.logginIn(email: email, password: password);
      currentUser = userObject;
      return Right(userObject);
    } on LoginException catch (error) {
      switch (error.code) {
        case "invalid-email":
          return Left(LoggingFailure(
              message: "The Email is not valid !", email: email));
          break;
        case "user-disabled":
          return Left(LoggingFailure(
              message: "This User has been disabled !", email: email));
          break;
        default:
          return Left(LoggingFailure(
              message: "Email or Password incorrect !", email: email));
      }
    } on ServerException {
      return Left(ServerFailure(message: "Error"));
    }
  }

  @override
  // ignore: missing_return
  Future<Either<Failure, UserObject>> register(
      {String email, String password, String displayName}) async {
    var isConnected = await netWorkInfo.isConnected();
    if (!isConnected) {
      return Left(NoInternetConnectionFailure(
          message: "Internet Connection Required ! "));
    }

    try {
      final userObject = await remoteDataSource.createUser(
          email: email, password: password, displayName: displayName);
      currentUser = userObject;
      return Right(userObject);
    } on LoginException catch (error) {
      switch (error.code) {
        case "invalid-email":
          return Left(RegisterFailure(
              message: "The Email is not valid !",
              email: email,
              displayName: displayName));
          break;
        case "email-already-in-use":
          return Left(RegisterFailure(
              message: "The Email adress already exists !",
              email: email,
              displayName: displayName));
          break;
        case "weak-password":
          return Left(RegisterFailure(
              message: "Your password is not too strong",
              email: email,
              displayName: displayName));
      }
    } on ServerException {
      return Left(ServerFailure(message: "Error"));
    }
  }
}
