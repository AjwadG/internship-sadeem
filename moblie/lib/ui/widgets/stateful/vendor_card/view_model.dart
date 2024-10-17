import 'package:flutter/material.dart';
import 'package:internship/core/models/vendor/vendor.dart';
import 'package:internship/core/services/navigation/navigation_service.dart';
import 'package:internship/locator.dart';
import 'package:internship/ui/router.gr.dart';
import 'package:stacked/stacked.dart';

class VendorCardViewModel extends BaseViewModel {
  Vendor? vendor;
  BuildContext? context;

  Future<void> init(BuildContext context, Vendor vendor) async {
    setBusy(true);
    notifyListeners();
    this.vendor = vendor;
    this.context = context;
    setBusy(false);
  }

  Future<void> moveToVendor() async {
    ///
    await locator<NavigationService>()
        .popAllAndPushNamed(VendorViewRoute(vendor: vendor!));
  }
}
