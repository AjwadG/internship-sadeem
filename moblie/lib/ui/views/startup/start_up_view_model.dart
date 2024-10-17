import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:internship/app.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/ui/shared/device_type.dart';
import 'package:stacked/stacked.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';
import '/ui/router.gr.dart';
import '../../../core/enums/http_request_type.dart';
import '../../../core/models/meta/meta.dart';
import '../../../core/repositories/magical_repository.dart';

class StartUpViewModel extends BaseViewModel {
  BuildContext? context;


  Future handleStartUpLogic(BuildContext context) async {
    this.context = context;

    MyApp.context = context;

    setBusy(true);

    try {
      locator<KeyStorageService>().meta = await (locator<MagicalRepository>()
          .handelRequest(
              model: Meta(),
              parameters: {},
              methodType: HTTPMethodType.GET,
              route: ApiRoutes.meta));

    } catch (e) {}

    setBusy(false);
    await Future.delayed(Duration(milliseconds: 1400));
    await loadHome();
  }

  Future<void> loadHome() async {
    if (locator<KeyStorageService>().token!.isEmpty) {
      if (DeviceType.isMobile &&
          locator<KeyStorageService>().isFirstOpen == true) {
        unawaited(
            locator<NavigationService>().popAllAndPushNamed(MainViewRoute()));
      } else {
        unawaited(
            locator<NavigationService>().popAllAndPushNamed(LoginViewRoute()));
      }
    } else {
      unawaited(
          locator<NavigationService>().popAllAndPushNamed(MainViewRoute()));
    }
  }
}
