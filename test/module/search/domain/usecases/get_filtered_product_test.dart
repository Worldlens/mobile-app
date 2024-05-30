import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search/domain/repositories/search_repositories.dart';
import 'package:flutter_application_1/module/search/domain/usecases/get_filtered_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'mock_search_repo.mock.dart';

void main() {
  late SearchRepository repository;
  late GetFilteredProduct usecase;

  setUp(() {
    repository = MockSearchRepo();
    usecase = GetFilteredProduct(repository);
  });
  final param = [Product.empty().name];
  final tResponse = [Product.empty()];
  test('should call repo.getfiltered_product return a list of product',
      () async {
    when(() => repository.getFilteredProduct(list: param))
        .thenAnswer((_) async => Right(tResponse));

    final result = await usecase(param);

    expect(result, Right(tResponse));
    verify(() => repository.getFilteredProduct(list: param)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
