import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internship/locator.dart';
import 'package:stacked/stacked.dart';


class AboutModel extends BaseViewModel {
  // List<Setting> settings = [];
  var settings = [];

  BuildContext? context;
  PackageInfo? packageInfo;
  String? version = '';
  String? buildNumber = '';

  Future<void> init() async {
    setBusy(true);
    try {
      packageInfo = await PackageInfo.fromPlatform();
      version = packageInfo!.version;
      buildNumber = packageInfo!.buildNumber;
    } catch (e) {
      print(e);
    }

    setBusy(false);
  }
}
