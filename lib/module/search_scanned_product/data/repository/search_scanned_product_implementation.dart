import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/search_scanned_product/data/datasources/search_scanned_product_datasource.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/repository/search_scanned_product.dart';

class SearchScannedProductImplementation implements SearchScannedRepository {
  SearchScannedProductImplementation(this._remoteDataSource);
  final SearchScannedProductRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Product>> getFilteredScannedProduct({required list}) async {
    // TODO: implement getFilteredScannedProduct
    try {
      final result =
          await _remoteDataSource.getFilteredScannedProduct(list: list);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Product>> getRecentSearchScannedProduct() async {
    // TODO: implement getRecentSearchScannedProduct
    try {
      final result = await _remoteDataSource.getRecentSearchScannedProduct();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Product>> searchScannedProduct({required name}) async {
    // TODO: implement searchScannedProduct
    try {
      final result = await _remoteDataSource.searchScannedProduct(name: name);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
