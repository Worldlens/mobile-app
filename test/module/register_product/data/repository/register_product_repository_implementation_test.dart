import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/module/register_product/data/datasources/register_product_remote_datasource.dart';
import 'package:flutter_application_1/module/register_product/data/repository/register_product_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterProductDataSrc extends Mock
    implements RegisterProductRemoteDataSource {}

void main() {
  late RegisterProductRemoteDataSource remoteDataSource;
  late RegisProductRepositoryImplementation repoImpl;

  setUp(() {
    remoteDataSource = MockRegisterProductDataSrc();
    repoImpl = RegisProductRepositoryImplementation(remoteDataSource);
  });

  group('RegisterProduct', () {
    String name = '';
    String des = '';
    String manufacture = '';
    String country = '';

    test('should call remoteData.RegisterProduct return void', () async {
      //arange
      when(() => remoteDataSource.submitProduct(
              name: any(named: 'name'),
              country: any(named: 'country'),
              description: any(
                named: 'description',
              ),
              manufacture: any(named: 'manufacture')))
          .thenAnswer((_) async => Future.value());

      final result = await repoImpl.submitProduct(
          name: name,
          country: country,
          description: des,
          manufacture: manufacture);

      expect(result, const Right(null));
      //assert
      verify(() => remoteDataSource.submitProduct(
          name: name,
          country: country,
          description: des,
          manufacture: manufacture)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a failure when the call is unsuccess', () async {
      when(() => remoteDataSource.submitProduct(
              name: any(named: 'name'),
              country: any(named: 'country'),
              description: any(named: 'description'),
              manufacture: any(named: 'manufacture')))
          .thenThrow(const ServerException(message: '', statusCode: 500));

      final result = await repoImpl.submitProduct(
          name: name,
          country: country,
          description: des,
          manufacture: manufacture);

      expect(result,
          equals(const Left(ServerFailure(message: '', statusCode: 500))));

      verify(() => remoteDataSource.submitProduct(
          name: name,
          country: country,
          description: des,
          manufacture: manufacture)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
