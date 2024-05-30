import 'dart:convert';

import 'package:flutter_application_1/core/data/models/product_model.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/module/history/presentation/cubit/submitted_product_state.dart';
import 'package:http/http.dart' as http;

abstract class HistoryRemoteDataSrc {
  const HistoryRemoteDataSrc();

  Future<List<ProductModel>> getSubmittedItems();
}

class HistoryRemoteDataSrcImpl extends HistoryRemoteDataSrc {
  HistoryRemoteDataSrcImpl({required this.client});

  var client = http.Client();

  @override
  Future<List<ProductModel>> getSubmittedItems() async {
    // TODO: implement getItems
    try {
      final response = await http.get(Uri.parse(
          'https://worldlens-stag.vertiree.com/api/metadata-service/product'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException(message: '', statusCode: 400);
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.toString(), statusCode: e.statusCode);
    }
  }
}
