import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/module/details/data/datasources/details_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/response.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late DetailshRemoteDataSource remoteDataSource;

  setUp(() {
    dio = MockDio();
    remoteDataSource = DetailshRemoteDataSourceImpl(dio);
  });

  group("verifyProduct", () {
    test("should complete successfully when statuscode is 200 or 201",
        () async {
      when(() => dio.post(any(), data: any(named: 'data')))
          .thenAnswer((_) async => customResponse);

      final methodCall = remoteDataSource.verifyProduct;

      expect(methodCall(id: "1"), completes);
      verify(() => dio.post('$BaseUrl$kVeryfiProductEndpoint/1',
          data: jsonEncode({'id': "1"}))).called(1);
      verifyNoMoreInteractions(dio);
    });

    test("should thorw exception when statuscode not 200 or 201", () async {
      when(() => dio.post(any(), data: any(named: 'data')))
          .thenAnswer((_) async => customResponseFail);

      final methodCall = remoteDataSource.verifyProduct;

      expect(() => methodCall(id: "1"),
          throwsA(const ServerException(message: "Fail", statusCode: 500)));
      verify(() => dio.post('$BaseUrl$kVeryfiProductEndpoint/1',
          data: jsonEncode({'id': "1"}))).called(1);
      verifyNoMoreInteractions(dio);
    });
  });
}
