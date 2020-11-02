import 'package:adopt_my_pet_dz/core/network/network_info.dart';
import 'package:adopt_my_pet_dz/core/shared/routes.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/datasources/authentication_local_data_sources.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/datasources/authentication_remote_data_sources.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/repository/authentication_repository.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/repository/authentication_repository.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/usecases/is_logged_in.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/usecases/logging_in.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/usecases/register.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/isloggedin_bloc/isloggedin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/loggingin_bloc/loggingin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Shared
  sl.registerLazySingleton<NetworkInfo>(
      () => NetWorkInfoImpl(dataConnectionChecker: sl()));

  //! Authentication
  sl.registerFactory(() => IsloggedinBloc(isLoggedInCase: sl()));
  sl.registerFactory(() => LogginginBloc(loggingInCase: sl()));
  sl.registerFactory(() => RegisterBloc(registerCase: sl()));

  //* UseCase
  sl.registerLazySingleton(() => RegisterCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsLoggedInCase(authRepository: sl()));
  sl.registerLazySingleton(() => LoggingInCase(authRepository: sl()));

  //* Repository
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          localDataSource: sl(), remoteDataSource: sl(), netWorkInfo: sl()));

  //*DataSources
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(fireBaseAuth: sl()));

  //* Externals
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
