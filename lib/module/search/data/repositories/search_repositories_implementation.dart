import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/search/data/datasources/search_remote_datasource.dart';
import 'package:flutter_application_1/module/search/domain/repositories/search_repositories.dart';

class SearchRepositoryImplementation implements SearchRepository {
  SearchRepositoryImplementation(this._remoteDataSource);
  final SearchRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Product>> getFilteredProduct({required list}) async {
    // TODO: implement getFilteredProduct
    try {
      final result = await _remoteDataSource.getFilteredProduct(list: list);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Product>> getPopularProduct() async {
    // TODO: implement getPopularProduct
    try {
      final result = await _remoteDataSource.getPopularProduct();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Product>> getSearchHistory() async {
    // TODO: implement getSearchHistory
    try {
      final result = await _remoteDataSource.getSearchHistory();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Product>> searchProduct({required name}) async {
    // TODO: implement searchProduct
    try {
      final result = await _remoteDataSource.searchProduct(name: name);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
