

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/rest_client.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource{
  Future<Either<ServerFailure, UserModel>> getUserById(String userName);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final RestClient restClient;
  // var baseUri = Uri.frUri.parse("http://localhost:8000/api/v1");
  
  
  UserRemoteDataSourceImpl({required this.restClient});

  @override
  Future<Either<ServerFailure, UserModel>> getUserById(String userName) async {
    final result = await restClient.get(Uri.parse("http://localhost:8000/api/v1/users/$userName"));
    return result.fold((l) => Left(l), (r) => Right(UserModel.fromJson(r)));
  }
}