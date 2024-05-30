import 'package:flutter_application_1/core/data/models/product_model.dart';

abstract class SearchScannedProductRemoteDataSource {
  Future<List<ProductModel>> getRecentSearchScannedProduct();

  Future<List<ProductModel>> searchScannedProduct({required name});

  //ResultFuture<List<Product>> getPopularProduct();

  Future<List<ProductModel>> getFilteredScannedProduct({required list});
}

class SearchScannedProductRemoteDataSourceImpl
    implements SearchScannedProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getFilteredScannedProduct({required list}) {
    // TODO: implement getFilteredScannedProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getRecentSearchScannedProduct() {
    // TODO: implement getRecentSearchScannedProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> searchScannedProduct({required name}) {
    // TODO: implement searchScannedProduct
    throw UnimplementedError();
  }
}
