import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/module/details/data/datasources/details_remote_datasource.dart';
import 'package:flutter_application_1/module/details/data/repository/details_repository_implementations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDetailsDataSrc extends Mock implements DetailshRemoteDataSource {}

void main() {
  late DetailshRemoteDataSource remoteDataSource;
  late DetailsRepositoryImplementations repoImpl;

  setUp(() {
    remoteDataSource = MockDetailsDataSrc();
    repoImpl = DetailsRepositoryImplementations(remoteDataSource);
  });

  group('veryfyproduct', () {
    const id = 1;
    test('should call remoteData.veryfyproduct return void', () async {
      //arange
      when(
        () => remoteDataSource.verifyProduct(id: any(named: 'id')),
      ).thenAnswer((_) async => Future.value());

      final result = await repoImpl.verifyProduct(id: id);

      expect(result, const Right(null));
      //assert
      verify(() => remoteDataSource.verifyProduct(id: id)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.verifyProduct(id: any(named: 'id')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.verifyProduct(id: id);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.verifyProduct(id: id)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
