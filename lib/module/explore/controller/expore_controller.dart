import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/explore/presentation/explore.dart';

extension ExploreController on ExploreState {
  void moveToSearchPage(BuildContext context) {
    Navigator.pushNamed(context, '/search');
  }

  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void moveToTrendingItem() {}
  void moveToBeverage() {}
  void moveToMusic() {}

  void moveToFood() {}

  void moveToElectronic() {}
}
