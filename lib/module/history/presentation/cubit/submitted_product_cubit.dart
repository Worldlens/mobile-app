import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/data/models/product_model.dart';
import 'package:flutter_application_1/module/history/domain/usecase/get_submitted_item.dart';
import 'package:flutter_application_1/module/history/presentation/cubit/submitted_product_state.dart';
import 'package:http/http.dart' as http;

class SubmittedProductCubit extends Cubit<SubmittedProductState> {
  SubmittedProductCubit({required GetSubmittedItemUseCase getSubmittedItems})
      : _getSubmittedItems = getSubmittedItems,
        super(DataInitial());
  final GetSubmittedItemUseCase _getSubmittedItems;

  fetchSubmittedProduct() async {
    emit(DataLoading());
    Future.delayed(const Duration(seconds: 5));
    final result = await _getSubmittedItems();

    result.fold((failure) => emit(DataError(failure.message)), (items) {
      if (items == null || items.isEmpty) {
        emit(DataError("No items found"));
      } else {
        emit(DataLoaded(items));
      }
    });
  }

  // fetchSubmittedProduct() async {
  //   emit(DataLoading());
  //   //List<ProductModel> productList = [];
  //   Future.delayed(const Duration(seconds: 5));
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'https://worldlens-stag.vertiree.com/api/metadata-service/product'));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = jsonDecode(response.body)['data'];
  //       var productData =
  //           data.map((json) => ProductModel.fromJson(json)).toList();
  //       emit(DataLoaded(productData));
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     emit(DataError(e.toString()));
  //   }
  // }
}
