import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medit_frontend_2022/features/user/domain/repositories/user_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';

class GetUserById implements UseCase<User, Params>{
    final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.getUserById(params.userName);
  }
}


class Params extends Equatable{
  final String userName;
  const Params({required this.userName});
  @override
  List<Object?> get props => [userName];
}