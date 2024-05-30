import 'package:dio/dio.dart';

Response customResponse = Response(
    statusCode: 200,
    statusMessage: 'OK',
    headers: Headers.fromMap({
      'content-type': ['application/json']
    }),
    requestOptions: RequestOptions(path: '/custom/path'),
    data: {'message': 'Custom Response Data'},
  );

  Response customResponseFail = Response(
    statusCode: 500,
    statusMessage: 'Fail',
    headers: Headers.fromMap({
      'content-type': ['application/json']
    }),
    requestOptions: RequestOptions(path: '/custom/path'),
    data: {'message': 'Custom Response Data'},
  );