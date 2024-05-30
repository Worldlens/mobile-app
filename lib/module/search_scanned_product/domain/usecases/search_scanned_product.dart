import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/repository/search_scanned_product.dart';

class SearchScannedProduct extends UseCaseWithParam<List<Product>, String> {
  SearchScannedProduct(this._repository);

  final SearchScannedRepository _repository;

  @override
  ResultFuture<List<Product>> call(String params) =>
      _repository.searchScannedProduct(name: params);
}
