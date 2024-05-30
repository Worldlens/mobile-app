import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search/domain/repositories/search_repositories.dart';
import 'package:flutter_application_1/module/search/domain/usecases/get_search_history.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_search_repo.mock.dart';

void main() {
  late GetSearchHistory usecase;
  late SearchRepository repository;

  setUp(() {
    repository = MockSearchRepo();
    usecase = GetSearchHistory(repository);
  });
  const tResponse = [Product.empty()];

  test(
      'should call [SearchRepo.getSearchHistory] return the right data[List<Product>]',
      () async {
    when(
      () => repository.getSearchHistory(),
    ).thenAnswer((_) async => const Right(tResponse));

    final result = await usecase();

    expect(result, const Right(tResponse));
    verify(() => repository.getSearchHistory()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
