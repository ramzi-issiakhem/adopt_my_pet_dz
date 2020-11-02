import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/core/usecases/usecases.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class LoggingInCase implements UseCase<UserObject, Params> {
  final AuthenticationRepository authRepository;

  LoggingInCase({@required this.authRepository});

  @override
  Future<Either<Failure, UserObject>> call(Params params) async {
    return await authRepository.loggingIn(
        email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});

  @override
  List<Object> get props => [];
}
