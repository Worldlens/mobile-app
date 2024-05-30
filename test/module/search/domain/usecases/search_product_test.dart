import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search/domain/repositories/search_repositories.dart';
import 'package:flutter_application_1/module/search/domain/usecases/search_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_search_repo.mock.dart';

void main() {
  late SearchProduct usecase;
  late SearchRepository repository;

  setUp(() {
    repository = MockSearchRepo();
    usecase = SearchProduct(repository);
  });
  const param = Product.empty();
  const tResponse = [Product.empty()];

  test('call repo.searchproduct return a list of product', () async {
    when(() => repository.searchProduct(name: any(named: 'name')))
        .thenAnswer((_) async => const Right(tResponse));

    final result = await usecase(param.name);
    expect(result, const Right<dynamic, List<Product>>(tResponse));
    verify(() => repository.searchProduct(
          name: param.name,
        )).called(1);

    verifyNoMoreInteractions(repository);
  });
}
