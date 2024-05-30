import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/register_product/data/datasources/register_product_remote_datasource.dart';
import 'package:flutter_application_1/module/register_product/domain/repository/register_product_repository.dart';

class RegisProductRepositoryImplementation
    implements RegisterProductRepository {
  final RegisterProductRemoteDataSource _remotedataSource;

  RegisProductRepositoryImplementation(this._remotedataSource);

  @override
  ResultFuture<void> submitProduct(
      // {required name,
      // required manufacture,
      // required country,
      // required description}
      ) async {
    try {
      final result = await _remotedataSource.submitProduct(
          // country: country,
          // description: description,
          // manufacture: manufacture,
          // name: name
          );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
    // TODO: implement submitProduct
  }
}
