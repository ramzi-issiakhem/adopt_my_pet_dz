import 'package:adopt_my_pet_dz/core/errors/exceptions.dart';
import 'package:adopt_my_pet_dz/core/errors/failures.dart';
import 'package:adopt_my_pet_dz/core/network/network_info.dart';
import 'package:adopt_my_pet_dz/features/Lost/data/datasources/local_data_sources.dart';
import 'package:adopt_my_pet_dz/features/Lost/data/datasources/remote_data_sources.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/entity/lost_entity.dart';
import 'package:adopt_my_pet_dz/features/Lost/domain/repositories/lost_repository.dart';
import 'package:dartz/dartz.dart';

class LostRepositoryImpl implements LostRepository {
  final LostRemoteDataSource remoteDataSource;
  final LostLocalDataSource localDataSource;
  final NetworkInfo netWorkInfo;

  LostRepositoryImpl(
      {this.remoteDataSource, this.localDataSource, this.netWorkInfo});

  @override
  Future<Either<Failure, LostEntity>> initLostPage() async {
    var isConnected = await netWorkInfo.isConnected();
    if (!isConnected) {
      return Left(NoInternetConnectionFailure(
          message: "Internet Connection Required ! "));
    }

    try {
      final lostEntity = await remoteDataSource.getLostEntity();
      return Right(lostEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
