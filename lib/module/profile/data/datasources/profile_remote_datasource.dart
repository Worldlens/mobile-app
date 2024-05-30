import 'package:flutter_application_1/module/profile/data/model/user_model.dart';

abstract class ProfileRemoteDataSrc {
  Future<UserModel> getUser();

  @override
  Future<void> shareUser({required UserModel user});

  @override
  Future<UserModel> updateUser({required name, required id});
}

class ProfileRemoteDataSrcImpl implements ProfileRemoteDataSrc {
  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> shareUser({required UserModel user}) {
    // TODO: implement shareUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser({required name, required id}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
