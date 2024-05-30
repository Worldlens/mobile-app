import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/module/register_product/domain/repository/register_product_repository.dart';
import 'package:flutter_application_1/module/register_product/domain/usecase/register_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterProductRepo extends Mock
    implements RegisterProductRepository {}

void main() {
  late RegisterProduct usecase;
  late RegisterProductRepository repository;
  const params = Product.empty();

  setUp(() {
    repository = MockRegisterProductRepo();
    usecase = RegisterProduct(repository);
  });
  test('should call [registerrepo.submitproduct]', () async {
    when(
      () => repository.submitProduct(
          name: any(named: 'name'),
          manufacture: any(named: 'manufacture'),
          country: any(named: 'country'),
          description: any(named: 'description')),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase(params);
    expect(result, const Right<dynamic, void>(null));
    verify(() => repository.submitProduct(
        name: params.name,
        manufacture: params.manufacture,
        country: params.country,
        description: params.des)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
