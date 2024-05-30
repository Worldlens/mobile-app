import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/module/search/data/datasources/search_remote_datasource.dart';
import 'package:flutter_application_1/module/search/data/repositories/search_repositories_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchDataSrc extends Mock implements SearchRemoteDataSource {}

void main() {
  late SearchRemoteDataSource remoteDataSource;
  late SearchRepositoryImplementation repoImpl;
  setUp(() {
    remoteDataSource = MockSearchDataSrc();
    repoImpl = SearchRepositoryImplementation(remoteDataSource);
  });

  group('SearchProduct', () {
    String name = '';
    test('should call remoteData.SearchProduct return ListOfProduct', () async {
      //arange
      when(() => remoteDataSource.searchProduct(name: any(named: 'name')))
          .thenAnswer((_) async => []);
      final result = await repoImpl.searchProduct(name: name);

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.searchProduct(name: name)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.searchProduct(name: any(named: 'name')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.searchProduct(name: name);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.searchProduct(name: name)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
  group('getFilteredProduct', () {
    List<String> name = [''];
    test('should call remoteData.getFilteredProduct return ListOfProduct',
        () async {
      //arange
      when(() => remoteDataSource.getFilteredProduct(list: any(named: 'list')))
          .thenAnswer((_) async => []);
      final result = await repoImpl.getFilteredProduct(list: name);

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.getFilteredProduct(list: name)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.getFilteredProduct(list: any(named: 'list')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.getFilteredProduct(list: name);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.getFilteredProduct(list: name)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
  group('getSearchHistory', () {
    test('should call remoteData.getSearchHistory return ListOfProduct',
        () async {
      when(() => remoteDataSource.getSearchHistory())
          .thenAnswer((_) async => []);
      final result = await repoImpl.getSearchHistory();

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.getSearchHistory()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.getSearchHistory())
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.getSearchHistory();

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.getSearchHistory()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('getPopularProduct', () {
    test('should call remoteData.getPopularProduct return ListOfProduct',
        () async {
      when(() => remoteDataSource.getPopularProduct())
          .thenAnswer((_) async => []);
      final result = await repoImpl.getPopularProduct();

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.getPopularProduct()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.getPopularProduct())
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.getPopularProduct();

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.getPopularProduct()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
