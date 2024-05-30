import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search/domain/repositories/search_repositories.dart';

class GetPopularProduct extends UseCaseWithOutParam<List<Product>> {
  GetPopularProduct(this._repository);
  final SearchRepository _repository;

  @override
  ResultFuture<List<Product>> call() => _repository.getPopularProduct();
}
