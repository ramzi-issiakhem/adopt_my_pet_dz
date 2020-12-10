import 'dart:async';

import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/usecases/init_lost_page_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'initlostpage_event.dart';
part 'initlostpage_state.dart';

class InitlostpageBloc
    extends Bloc<InitlostpageEventAbstract, InitlostpageState> {
  final InitLostPageUseCase initLostPageUseCase;
  InitlostpageBloc({this.initLostPageUseCase}) : super(Empty());

  @override
  Stream<InitlostpageState> mapEventToState(
    InitlostpageEventAbstract event,
  ) async* {
    if (event is InitLostPageEvent) {
      yield Loading();
      final failureOrLostEntity = await initLostPageUseCase.call(NoParams());
      yield failureOrLostEntity.fold(
        (error) => Error(message: error.message),
        (entity) => Loaded(data: entity),
      );
    }
  }
}
