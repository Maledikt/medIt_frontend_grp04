import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/bloc/app_cubit.dart';
import 'core/network/rest_client.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/usecases/get_user_by_id.dart';
import 'features/user/presentation/bloc/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async{

  // Use cases
  sl.registerLazySingleton(() => GetUserById(sl<UserRepositoryImpl>()));

  // Bloc
  sl.registerLazySingleton(() => AppCubit(navigatorKey: sl()));
  sl.registerFactory(() => UserCubit(getUserById: sl<GetUserById>()));


  // Repositories
  sl.registerLazySingleton(() => UserRepositoryImpl(source: sl<UserRemoteDataSourceImpl>()));

  // Data sources
  sl.registerLazySingleton(() => UserRemoteDataSourceImpl(restClient: sl<RestClientImpl>()));

  // Core
  sl.registerLazySingleton(() => RestClientImpl(client: sl()));
  sl.registerLazySingleton(() => GlobalKey<NavigatorState>());

  // External
  sl.registerLazySingleton(() => http.Client());
}