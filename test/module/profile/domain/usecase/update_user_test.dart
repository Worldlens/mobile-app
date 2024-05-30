import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_application_1/module/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_application_1/module/profile/domain/usecase/update_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_profile_repo.mock.dart';

void main() {
  late ProfileRepository repository;
  late UpdateUser usecase;

  setUp(() {
    repository = MockSProfileRepo();
    usecase = UpdateUser(repository);
  });
  const param = User.empty();
  final userin4 = UserInfor(id: param.id, name: param.name);
  test('call repo.shareuser return a user', () async {
    when(() => repository.updateUser(
          id: param.id,
          name: param.name,
        )).thenAnswer((_) async => const Right(param));

    final result = await usecase(userin4);

    expect(result, const Right(param));
    verify(() => repository.updateUser(id: param.id, name: param.name))
        .called(1);
    verifyNoMoreInteractions(repository);
  });
}
