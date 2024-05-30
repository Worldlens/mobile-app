import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search/domain/repositories/search_repositories.dart';
import 'package:flutter_application_1/module/search/domain/usecases/get_popular_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_search_repo.mock.dart';

void main() {
  late SearchRepository repository;
  late GetPopularProduct usecase;

  setUp(() {
    repository = MockSearchRepo();
    usecase = GetPopularProduct(repository);
  });
  const tResponse = [Product.empty()];

  test('make sure SearchRepo.getPopularProduct', () async {
    when(() => repository.getPopularProduct())
        .thenAnswer((_) async => const Right(tResponse));

    final result = await usecase();

    expect(result, const Right(tResponse));
    verify(() => repository.getPopularProduct()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
