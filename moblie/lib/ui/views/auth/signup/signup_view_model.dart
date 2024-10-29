import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/core/enums/http_request_type.dart';
import 'package:internship/core/mixins/validators.dart';
import 'package:internship/core/models/user/user.dart';
import 'package:internship/core/repositories/magical_repository.dart';
import 'package:internship/core/services/navigation/navigation_service.dart';
import 'package:internship/core/services/snackbar/snack_bar_service.dart';
import 'package:internship/generated/l10n.dart';
import 'package:internship/locator.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel with Validators {
  BuildContext? context;
  Future<void> init(BuildContext context) async {
    setBusy(true);
    this.context = context;
    setBusy(false);
  }

  Future<void> signUp(Map<String, String> parameters) async {
    setBusy(true);
    try {
      await locator<MagicalRepository>().handelRequest(
          model: User(),
          parameters: parameters,
          methodType: HTTPMethodType.POST_FORM_DATA,
          route: ApiRoutes.register);
      await moveToLogin();
    } catch (e) {
      locator<SnackBarService>().showSnackBarMessage(
          AppLocalizations.of(context!).wrong_number_or_email,
          3,
          Colors.orangeAccent,
          context!);
    }

    setBusy(false);
  }

  Future<void> moveToLogin() async {
    // small 🎁
    locator<NavigationService>().pop(context!);
  }
}
