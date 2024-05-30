import 'package:flutter_application_1/core/utils/typedef.dart';

abstract class RegisterProductRepository {
  RegisterProductRepository();

  ResultFuture<void> submitProduct();
}
