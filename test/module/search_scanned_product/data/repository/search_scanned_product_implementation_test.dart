import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/module/search_scanned_product/data/datasources/search_scanned_product_datasource.dart';
import 'package:flutter_application_1/module/search_scanned_product/data/repository/search_scanned_product_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchScannedProductDataSrc extends Mock
    implements SearchScannedProductRemoteDataSource {}

void main() {
  late SearchScannedProductRemoteDataSource remoteDataSource;
  late SearchScannedProductImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockSearchScannedProductDataSrc();
    repoImpl = SearchScannedProductImplementation(remoteDataSource);
  });

  group('getRecentSearchScannedProduct', () {
    test('should call remoteData.getRecentSearchScannedProduct return void',
        () async {
      //arange
      when(() => remoteDataSource.getRecentSearchScannedProduct())
          .thenAnswer((_) async => []);

      final result = await repoImpl.getRecentSearchScannedProduct();

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.getRecentSearchScannedProduct()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.getRecentSearchScannedProduct())
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.getRecentSearchScannedProduct();

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.getRecentSearchScannedProduct()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
  group('getFilteredScannedProduct', () {
    List<String> lst = [''];
    test('should call remoteData.getFilteredScannedProduct return void',
        () async {
      //arange
      when(() => remoteDataSource.getFilteredScannedProduct(
          list: any(named: 'list'))).thenAnswer((_) async => []);

      final result = await repoImpl.getFilteredScannedProduct(list: lst);

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.getFilteredScannedProduct(list: lst))
          .called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.getFilteredScannedProduct(
              list: any(named: 'lst')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.getFilteredScannedProduct(list: lst);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.getFilteredScannedProduct(list: lst))
          .called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('searchScannedProduct', () {
    String name = '';
    test('should call remoteData.searchScannedProduct return void', () async {
      //arange
      when(() =>
              remoteDataSource.searchScannedProduct(name: any(named: 'name')))
          .thenAnswer((_) async => []);

      final result = await repoImpl.searchScannedProduct(name: name);

      expect(result, isA<Right<dynamic, List<Product>>>());
      //assert
      verify(() => remoteDataSource.searchScannedProduct(name: name))
          .called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() =>
              remoteDataSource.searchScannedProduct(name: any(named: 'name')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.searchScannedProduct(name: name);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.searchScannedProduct(name: name))
          .called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
