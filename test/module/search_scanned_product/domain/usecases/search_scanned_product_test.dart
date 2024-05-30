import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/repository/search_scanned_product.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/usecases/search_scanned_product.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_search_scanned_product_repo.mock.dart';

void main() {
  late SearchScannedRepository repository;
  late SearchScannedProduct usecase;

  setUp(() {
    repository = MockSearchScannedProductRepo();
    usecase = SearchScannedProduct(repository);
  });
  final param = [Product.empty()];
  test('call repo.searchscannedproduct return a list of product', () async {
    when(() => repository.searchScannedProduct(name: param[0].name))
        .thenAnswer((_) async => Right(param));

    final result = await usecase(param[0].name);

    expect(result, Right(param));
    verify(() => repository.searchScannedProduct(name: param[0].name))
        .called(1);
    verifyNoMoreInteractions(repository);
  });
}
