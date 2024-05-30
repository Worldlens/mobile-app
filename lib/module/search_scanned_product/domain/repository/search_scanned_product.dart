import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';

abstract class SearchScannedRepository {
  SearchScannedRepository();

  ResultFuture<List<Product>> getRecentSearchScannedProduct();

  ResultFuture<List<Product>> searchScannedProduct({required name});

  //ResultFuture<List<Product>> getPopularProduct();

  ResultFuture<List<Product>> getFilteredScannedProduct({required list});
}
