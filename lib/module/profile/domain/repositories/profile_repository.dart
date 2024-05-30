import 'package:flutter_application_1/module/profile/domain/entities/user.dart';

import '../../../../core/utils/typedef.dart';

abstract class ProfileRepository {
  ProfileRepository();

  ResultFuture<User> getUser();
  ResultFuture<User> updateUser({required name, required id});
  ResultFuture<void> shareUser({required user});
}
