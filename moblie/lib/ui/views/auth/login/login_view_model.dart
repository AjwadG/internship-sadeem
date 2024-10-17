// ignore: library_prefixes
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pedantic/pedantic.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/core/enums/http_request_type.dart';
import 'package:internship/core/services/snackbar/snack_bar_service.dart';
import 'package:internship/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/models/token/token.dart';
import '/core/mixins/validators.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';
import '../../../../../core/services/auth/auth_service.dart';
import '../../../../../core/services/key_storage/key_storage_service.dart';
import '../../../../core/models/user/user.dart';
import '../../../../core/repositories/magical_repository.dart';
import '../../../router.gr.dart';

class LoginViewModel extends BaseViewModel with Validators {
  final _navigationService = locator<NavigationService>();
  final _log = Logger('HomeViewModel');

  BuildContext? context;
  PackageInfo? packageInfo;
  String? version = '';
  String? buildNumber = '';

  Future<void> init(BuildContext context) async {
    this.context = context;
    setBusy(true);
    packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo!.version;
    buildNumber = packageInfo!.buildNumber;

    setBusy(false);
  }

  Future<void> moveToVerify(String phone) async {
    setBusy(true);

    setBusy(false);
  }

  Future<void> loginWithEmail(Map<String, String> parameters) async {
    setBusy(true);

    bool? state = true;
    try {
      state = await locator<AuthService>().loginWithEmail(parameters);
      if (state!) {
        unawaited(
            locator<NavigationService>().popAllAndPushNamed(MainViewRoute()));
      }
    } catch (e) {
      locator<SnackBarService>().showSnackBarMessage(
          AppLocalizations.of(context!).wrong_number_or_email,
          3,
          Colors.orangeAccent,
          context!);
    }

    setBusy(false);
  }

  Future<void> moveToSignUp() async {
    // small 🎁
    await locator<NavigationService>().pushNamed(SignUpViewRoute());
  }
}
