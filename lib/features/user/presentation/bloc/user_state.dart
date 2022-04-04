import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

class UserState extends Equatable{
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserStatePending extends UserState {}

class UserStateIdle extends UserState {}

class UserStateReady extends UserState{
  final User user;
  const UserStateReady({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserStateError extends UserState{
  final String errorMessage;
  const UserStateError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}