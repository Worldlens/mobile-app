import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/module/search_scanned_product/presentation/search_scanned.dart';

extension SearchScannedProduct on SearchScannedProductState {
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
