import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/core/usecases/usecases.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class RegisterCase implements UseCase<UserObject, Params> {
  final AuthenticationRepository authRepository;

  RegisterCase({@required this.authRepository});

  @override
  Future<Either<Failure, UserObject>> call(Params params) async {
    return await authRepository.register(
        email: params.email,
        password: params.password,
        displayName: params.displayName);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String displayName;

  Params(
      {@required this.displayName,
      @required this.email,
      @required this.password});

  @override
  List<Object> get props => [];
}
