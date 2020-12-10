import 'dart:async';

import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/usecases/register.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterBlocEvent, RegisterState> {
  final RegisterCase registerCase;
  RegisterBloc({this.registerCase}) : super(Empty());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterBlocEvent event,
  ) async* {
    if (event is RegisterEvent) {
      yield Loading();
      final userOrFailure = await registerCase.call(Params(
          displayName: event.displayName,
          email: event.email,
          password: event.password));
      yield userOrFailure.fold((error) {
        if (error.runtimeType is RegisterFailure) {
          return RegisterError(
              email: error.email,
              message: error.message,
              displayName: error.displayName);
        } else {
          return Error(message: error.message);
        }
      }, (user) {
        return Loaded(userObject: user);
      });
    }
  }
}
