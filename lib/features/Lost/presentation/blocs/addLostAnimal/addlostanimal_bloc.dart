import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'addlostanimal_event.dart';
part 'addlostanimal_state.dart';

class AddlostanimalBloc extends Bloc<AddlostanimalEvent, AddlostanimalState> {
  AddlostanimalBloc() : super(Empty());

  @override
  Stream<AddlostanimalState> mapEventToState(
    AddlostanimalEvent event,
  ) async* {
    if (event is AddLostAnimal) {
      yield Loading();
    }
  }
}
