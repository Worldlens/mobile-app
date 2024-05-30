import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/history/domain/repo/history_repo.dart';

class GetSubmittedItemUseCase extends UseCaseWithOutParam<List<Product?>> {
  GetSubmittedItemUseCase(this._repo);
  final HistoryRepo _repo;

  @override
  ResultFuture<List<Product>> call() async => _repo.getSubmittedItems();
}
