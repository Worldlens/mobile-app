import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/history/presentation/history.dart';
import 'package:flutter_application_1/module/search_scanned_product/presentation/search_scanned.dart';

extension HistoryController on HistoryState {
  void goToSearchScannedProduct(BuildContext context) {
    //  Navigator.pushNamed(context, SearchScannedProduct.routeName);
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => const SearchScannedProduct()));
  }

  void goToHome(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  // Future<List<ProductModel>> fetchSubmittedProduct() async {
  //   // final dio = Dio();
  //   // var response = await dio.get(
  //   //     'https://worldlens-stag.vertiree.com/api/metadata-service/product');
  //   // //print(response.data);
  //   // //print(response.data["data"]);
  //   // var jsonListMap = response.data['data'];
  //   // var jsonString = jsonListMap.toString();
  //   // var jsonData = jsonDecode(jsonString);
  //   // print(jsonString);

  //   // // var jsonData = jsonDecode(jsonString);
  //   // // print(response.toString());
  //   // List<ProductModel> productList =
  //   //     jsonData.map((item) => ProductModel.fromJson(item)).toList();
  //   List<ProductModel> productList = [];
  //   final response = await http.get(Uri.parse(
  //       'https://worldlens-stag.vertiree.com/api/metadata-service/product'));
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     //print(response.body["data"]);
  //     final List<dynamic> data = jsonDecode(response.body)['data'];
  //     var productData =
  //         data.map((json) => ProductModel.fromJson(json)).toList();
  //     print(productData.toList());
  //     return productData;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.

  //     return productList;
  //   }
  // }
}
