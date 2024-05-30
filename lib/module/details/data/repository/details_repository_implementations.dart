import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/details/data/datasources/details_remote_datasource.dart';
import 'package:flutter_application_1/module/details/domain/repository/details_repository.dart';

class DetailsRepositoryImplementations implements DetailsRepository {
  DetailsRepositoryImplementations(this._remoteDataSource);
  final DetailshRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<void> verifyProduct({required id}) async {
    // TODO: implement verifyProduct
    try {
      final result = await _remoteDataSource.verifyProduct(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
