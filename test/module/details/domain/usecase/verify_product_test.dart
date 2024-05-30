import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/details/domain/repository/details_repository.dart';
import 'package:flutter_application_1/module/details/domain/usecase/verify_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVerifyProductRepo extends Mock implements DetailsRepository {}

void main() {
  late VerifyProduct usecase;
  late DetailsRepository repository;

  setUp(() {
    repository = MockVerifyProductRepo();
    usecase = VerifyProduct(repository);
  });
  const tResponse = [Product.empty()];
  const param = Product.empty();
  test('should call [DetailRepo.verifyProduct] return the right data[void]',
      () async {
    when(
      () => repository.verifyProduct(id: any(named: 'id')),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase(param.id);

    expect(result, const Right(null));
    verify(() => repository.verifyProduct(id: param.id)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
