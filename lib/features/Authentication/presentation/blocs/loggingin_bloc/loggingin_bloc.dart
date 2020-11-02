import 'dart:async';

import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/usecases/logging_in.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'loggingin_event.dart';
part 'loggingin_state.dart';

class LogginginBloc extends Bloc<LogginginEvent, LogginginState> {
  final LoggingInCase loggingInCase;
  LogginginBloc({@required this.loggingInCase}) : super(Empty());

  @override
  Stream<LogginginState> mapEventToState(
    LogginginEvent event,
  ) async* {
    if (event is LoggingInEvent) {
      yield Loading();
      final failureOrBool = await loggingInCase
          .call(Params(email: event.email, password: event.password));

      yield failureOrBool.fold(
        // ignore: missing_return
        (error) {
          print(error.runtimeType);
          if (error.runtimeType == LoggingFailure) {
            return LoggingError(message: error.message, email: error.email);
          } else if (error.runtimeType == ServerFailure) {
            return Error(message: error.message);
          }
        },
        (user) => Loaded(user: user),
      );
    }
  }
}
