import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/details/presentation/details.dart';

extension DetailController on DetailsState {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
