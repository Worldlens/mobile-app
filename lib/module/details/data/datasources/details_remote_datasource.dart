import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/utils/constant.dart';

abstract class DetailshRemoteDataSource {
  Future<void> verifyProduct({required id});
}

const kVeryfiProductEndpoint = '/Product';

class DetailshRemoteDataSourceImpl implements DetailshRemoteDataSource {
  DetailshRemoteDataSourceImpl(this.dio);
  late Dio dio;
  @override
  Future<void> verifyProduct({required id}) async {
    // TODO: implement verifyProduct
    final response = await dio.post('$BaseUrl$kVeryfiProductEndpoint/1',
        data: jsonEncode({"id": id}));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode ?? 500);
    }
  }
}
