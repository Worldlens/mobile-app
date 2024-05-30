import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/module/settings/settings.dart';

extension SettingController on SettingsState {
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
