import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/core/usecases/usecases.dart';
import 'package:adopt_my_pet_dz/core/usecases/usecases.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/repositories/lost_repository.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/blocs/initlostpagebloc/initlostpage_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InitLostPageUseCase implements UseCase<LostEntity, NoParams> {
  final LostRepository lostRepository;

  InitLostPageUseCase({this.lostRepository});
  @override
  Future<Either<Failure, LostEntity>> call(NoParams params) async {
    return await lostRepository.initLostPage();
  }
}

class NoParams extends Equatable {}
