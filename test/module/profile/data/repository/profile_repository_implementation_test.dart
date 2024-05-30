import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/module/profile/data/datasources/profile_remote_datasource.dart';
import 'package:flutter_application_1/module/profile/data/model/user_model.dart';
import 'package:flutter_application_1/module/profile/data/repository/profile_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileDataSource extends Mock implements ProfileRemoteDataSrc {}

void main() {
  late ProfileRemoteDataSrc remoteDataSource;
  late ProfileRepositoryImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockProfileDataSource();
    repoImpl = ProfileRepositoryImplementation(remoteDataSource);
    registerFallbackValue(const UserModel.empty());
  });

  group('getUser', () {
    const user = UserModel.empty();
    test('shouldCall _remoteDataSource.getUser return a User ', () async {
      when(() => remoteDataSource.getUser()).thenAnswer((_) async => user);
      final result = await repoImpl.getUser();

      expect(result, const Right(user));
      //assert
      verify(() => remoteDataSource.getUser()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.getUser())
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.getUser();

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.getUser()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('shareUser', () {
    const user = UserModel.empty();

    test('shouldCall _remoteDataSource.shareUser return a void ', () async {
      when(() => remoteDataSource.shareUser(user: any(named: 'user')))
          .thenAnswer((_) async => Future.value());
      final result = await repoImpl.shareUser(user: user);

      expect(result, const Right(null));
      //assert
      verify(() => remoteDataSource.shareUser(user: user)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.shareUser(user: any(named: 'user')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.shareUser(user: user);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.shareUser(user: user)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('updateUser', () {
    const user = UserModel.empty();
    test('shouldCall _remoteDataSource.updateUser return a User ', () async {
      when(() => remoteDataSource.updateUser(
          id: any(named: 'id'),
          name: any(named: 'name'))).thenAnswer((_) async => user);
      final result = await repoImpl.updateUser(id: user.id, name: user.name);

      expect(result, const Right(user));
      //assert
      verify(() => remoteDataSource.updateUser(id: user.id, name: user.name))
          .called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.updateUser(
              id: any(named: 'id'), name: any(named: 'id')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.updateUser(id: user.id, name: user.name);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.updateUser(id: user.id, name: user.name))
          .called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
