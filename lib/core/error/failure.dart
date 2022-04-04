import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String failureTypeString;
  final String message;
  const Failure(this.failureTypeString, this.message);

  @override
  List<Object?> get props => [failureTypeString];
}

// general failures
class ServerFailure extends Failure {
  final int statusCode;

  const ServerFailure({required this.statusCode, required message})
      : super('SERVER_FAILURE', message);
}
