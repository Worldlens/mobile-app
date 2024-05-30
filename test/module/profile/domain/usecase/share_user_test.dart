import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_application_1/module/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_application_1/module/profile/domain/usecase/share_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_profile_repo.mock.dart';

void main() {
  late ProfileRepository repository;
  late ShareUser usecase;

  setUp(() {
    repository = MockSProfileRepo();
    usecase = ShareUser(repository);
  });
  const param = User.empty();
  test('call repo.shareuser return a user', () async {
    when(() => repository.shareUser(user: param))
        .thenAnswer((_) async => const Right(null));

    final result = await usecase(param);

    expect(result, const Right(null));
    verify(() => repository.shareUser(user: param)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
