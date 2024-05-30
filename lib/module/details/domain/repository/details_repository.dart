import 'package:flutter_application_1/core/utils/typedef.dart';

abstract class DetailsRepository {
  DetailsRepository();

  ResultFuture<void> verifyProduct({required id});
}
