import 'package:flutter_application_1/core/utils/typedef.dart';

abstract class UseCaseWithOutParam<Type> {
  UseCaseWithOutParam();
  ResultFuture<Type> call();
}

abstract class UseCaseWithParam<Type, Params> {
  UseCaseWithParam();
  ResultFuture<Type> call(Params params);
}
