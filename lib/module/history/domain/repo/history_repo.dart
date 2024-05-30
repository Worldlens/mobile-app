import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';

abstract class HistoryRepo {
  ResultFuture<List<Product>> getSubmittedItems();
}
