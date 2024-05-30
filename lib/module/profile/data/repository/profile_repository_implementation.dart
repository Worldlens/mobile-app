import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/profile/data/datasources/profile_remote_datasource.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_application_1/module/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final ProfileRemoteDataSrc _remoteDataSource;
  ProfileRepositoryImplementation(this._remoteDataSource);

  @override
  ResultFuture<User> getUser() async {
    // TODO: implement getUser
    try {
      final result = await _remoteDataSource.getUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> shareUser({required user}) async {
    // TODO: implement shareUser
    try {
      final result = await _remoteDataSource.shareUser(user: user);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<User> updateUser({
    required name,
    required id,
  }) async {
    // TODO: implement updateUser
    try {
      final result = await _remoteDataSource.updateUser(
        id: id,
        name: name,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
