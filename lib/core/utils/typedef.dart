import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
