import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/core/usecases/usecases.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

//
class IsLoggedInCase implements UseCase<bool, NoParams> {
  final AuthenticationRepository authRepository;

  IsLoggedInCase({@required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepository.isLoggedIn();
  }
}
