import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_application_1/module/profile/domain/repositories/profile_repository.dart';

class GetUser extends UseCaseWithOutParam<User> {
  GetUser(this._repository);
  final ProfileRepository _repository;
  @override
  ResultFuture<User> call() => _repository.getUser();
}
