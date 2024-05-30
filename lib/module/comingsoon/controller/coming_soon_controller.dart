import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/comingsoon/presentation/comingsoon.dart';

extension ComingSoonController on ComingSoonState {
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
