import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/details/presentation/details.dart';
import 'package:flutter_application_1/module/explore/presentation/explore.dart';
import 'package:flutter_application_1/module/history/presentation/history.dart';
import 'package:flutter_application_1/module/home/presentation/home.dart';
import 'package:flutter_application_1/module/profile/presentation/profile.dart';
import 'package:flutter_application_1/module/scan_product/presentation/scan_product.dart';

import '../../settings/settings.dart';

extension HomeController on HomeState {
  void moveToExplore() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => const Explore()));
  }

  void moveToSetting() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => const Settings()));
  }

  void moveToProfile() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => const Profile()));
  }

  void moveToCamera() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => const ScanProduct(from: 'ABC',)));
  }

  void moveToProductSubmitted() {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => const Details()));
  }

  void moveToHistory(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => const History()));
  }

  void moveToProductVerified() {}
}
