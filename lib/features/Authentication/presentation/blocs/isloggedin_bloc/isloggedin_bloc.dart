import 'dart:async';

import 'package:adopt_my_pet_dz/core/usecases/usecases.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/usecases/is_logged_in.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'isloggedin_event.dart';
part 'isloggedin_state.dart';

class IsloggedinBloc extends Bloc<IsloggedinEvent, IsloggedinState> {
  final IsLoggedInCase isLoggedInCase;

  IsloggedinBloc({@required this.isLoggedInCase}) : super(Empty());

  @override
  Stream<IsloggedinState> mapEventToState(
    IsloggedinEvent event,
  ) async* {
    if (event is IsLoggedInEvent) {
      yield Loading();
      final failureOrBool = await isLoggedInCase.call(NoParams());
      yield failureOrBool.fold(
        (error) => Error(message: error.message),
        (state) => Loaded(state: state),
      );
    }
  }
}
