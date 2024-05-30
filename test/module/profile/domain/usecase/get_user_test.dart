import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_application_1/module/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_application_1/module/profile/domain/usecase/get_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_profile_repo.mock.dart';

void main() {
  late ProfileRepository repository;
  late GetUser usecase;

  setUp(() {
    repository = MockSProfileRepo();
    usecase = GetUser(repository);
  });
  const param = User.empty();
  test('call repo.getUser return a user', () async {
    when(() => repository.getUser()).thenAnswer((_) async => const Right(param));

    final result = await usecase();

    expect(result, const Right(param));
    verify(() => repository.getUser()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
