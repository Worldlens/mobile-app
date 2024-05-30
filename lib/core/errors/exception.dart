import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});
  final String message;
  final int statusCode;
  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode];
}
