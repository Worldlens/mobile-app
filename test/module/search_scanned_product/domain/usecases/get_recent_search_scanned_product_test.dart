import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/repository/search_scanned_product.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/usecases/get_recent_search_scanned_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_search_scanned_product_repo.mock.dart';

void main() {
  late SearchScannedRepository repository;
  late GetRecentSearchScannedProduct usecase;

  setUp(() {
    repository = MockSearchScannedProductRepo();
    usecase = GetRecentSearchScannedProduct(repository);
  });
  final param = [Product.empty()];
  test('call repo.getrecent return a list of product', () async {
    when(() => repository.getRecentSearchScannedProduct())
        .thenAnswer((_) async => Right(param));

    final result = await usecase();

    expect(result, Right(param));
    verify(() => repository.getRecentSearchScannedProduct()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
