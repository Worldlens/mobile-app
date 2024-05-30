import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/search/presentation/search.dart';

extension SearchController on SearchState {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
