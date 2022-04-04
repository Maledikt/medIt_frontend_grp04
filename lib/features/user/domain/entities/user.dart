import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String userName;
  final String email;
  final bool isSuperUser;
  final int? id;

  const User({
    required this.userName,
    required this.email,
    this.isSuperUser = false,
    this.id});

  @override
  List<Object?> get props => [id];
}