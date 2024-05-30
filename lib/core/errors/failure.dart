import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.statusCode, required this.message});

  final String message;
  final int statusCode;
  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});
}
