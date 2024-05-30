import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';

abstract class SearchRepository {
  SearchRepository();

  ResultFuture<List<Product>> getSearchHistory();

  ResultFuture<List<Product>> searchProduct({required name});

  ResultFuture<List<Product>> getPopularProduct();

  ResultFuture<List<Product>> getFilteredProduct({required list});
}
