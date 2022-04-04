import 'package:dartz/dartz.dart';
import 'package:medit_frontend_2022/features/user/data/datasources/user_remote_data_source.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource source;

  UserRepositoryImpl({required this.source});

  @override
  Future<Either<Failure, User>> getUserById(String userName) =>
      source.getUserById(userName);
}
