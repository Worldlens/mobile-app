import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/repository/search_scanned_product.dart';
import 'package:flutter_application_1/module/search_scanned_product/domain/usecases/get_filtered_scanned_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'mock_search_scanned_product_repo.mock.dart';

void main() {
  late SearchScannedRepository repository;
  late GetFilteredScannedProduct usecase;

  setUp(() {
    repository = MockSearchScannedProductRepo();
    usecase = GetFilteredScannedProduct(repository);
  });

  final param = [Product.empty().name];
  final tRespone = [Product.empty()];
  test(
      'call repo.getfilteredscannedproduct return a a list of filtered product',
      () async {
    when(() => repository.getFilteredScannedProduct(list: param))
        .thenAnswer((_) async => Right(tRespone));

    final result = await usecase(param);

    expect(result, Right(tRespone));
    verify(() => repository.getFilteredScannedProduct(list: param)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
