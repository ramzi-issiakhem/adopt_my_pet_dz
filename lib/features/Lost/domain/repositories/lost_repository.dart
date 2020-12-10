import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LostRepository {
  /// Return The LostEntity wich contains the list , location , etc ( connected)
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, LostEntity>> initLostPage();
}
