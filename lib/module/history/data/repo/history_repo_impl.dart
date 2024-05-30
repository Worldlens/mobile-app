import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/utils/typedef.dart';
import 'package:flutter_application_1/module/history/data/datasources/history_remote_data_source.dart';
import 'package:flutter_application_1/module/history/domain/repo/history_repo.dart';

class HistoryRepoIpmpl extends HistoryRepo {
  HistoryRepoIpmpl(this._dataSrc);
  HistoryRemoteDataSrc _dataSrc;
  @override
  ResultFuture<List<Product>> getSubmittedItems() async {
    // TODO: implement getSubmittedItems
    try {
      var items = await _dataSrc.getSubmittedItems();
      return Right(items);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
