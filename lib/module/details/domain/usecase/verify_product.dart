import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/details/domain/repository/details_repository.dart';

class VerifyProduct extends UseCaseWithParam<void, String> {
  VerifyProduct(this._repository);
  final DetailsRepository _repository;

  @override
  ResultFuture<void> call(String params) =>
      _repository.verifyProduct(id: params);
}
