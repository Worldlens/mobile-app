import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/register_product/domain/repository/register_product_repository.dart';

class RegisterProduct extends UseCaseWithParam<void, Product> {
  RegisterProduct(this._repository);

  final RegisterProductRepository _repository;

  @override
  ResultFuture<void> call(Product params) => _repository.submitProduct();
}
