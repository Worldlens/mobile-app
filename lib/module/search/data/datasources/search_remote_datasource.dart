import 'package:flutter_application_1/core/data/models/product_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductModel>> getSearchHistory();

  Future<List<ProductModel>> getPopularProduct();
  Future<List<ProductModel>> searchProduct({required String name});
  Future<List<ProductModel>> getFilteredProduct({required List<String> list});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  @override
  Future<List<ProductModel>> getFilteredProduct({required List<String> list}) {
    // TODO: implement getFilteredProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getPopularProduct() {
    // TODO: implement getPopularProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getSearchHistory() {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> searchProduct({required String name}) {
    // TODO: implement searchProduct
    throw UnimplementedError();
  }
}
