import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/repository/search_scanned_product.dart';

class GetFilteredScannedProduct
    extends UseCaseWithParam<List<Product>, List<String>> {
  final SearchScannedRepository _repository;
  GetFilteredScannedProduct(this._repository);

  @override
  ResultFuture<List<Product>> call(List<String> params) =>
      _repository.getFilteredScannedProduct(list: params);
}
