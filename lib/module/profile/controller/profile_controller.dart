import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/module/profile/presentation/profile.dart';

extension ProfileController on ProfileState {
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
