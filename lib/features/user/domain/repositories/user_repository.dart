import 'package:dartz/dartz.dart';
import 'package:medit_frontend_2022/core/error/failure.dart';

import '../entities/user.dart';

abstract class UserRepository{
  Future<Either<Failure, User>> getUserById(String userName);
}