import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/usecases/usecases.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_application_1/module/profile/domain/repositories/profile_repository.dart';

class UpdateUser extends UseCaseWithParam<User, UserInfor> {
  UpdateUser(this._repository);
  final ProfileRepository _repository;

  @override
  ResultFuture<User> call(params) =>
      _repository.updateUser(name: params.name, id: params.id);
}

class UserInfor extends Equatable {
  const UserInfor({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
