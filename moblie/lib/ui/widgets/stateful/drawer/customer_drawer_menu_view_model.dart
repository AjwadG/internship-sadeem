import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internship/core/services/permissions/permissions_service.dart';
import 'package:stacked/stacked.dart';

import '/core/services/auth/auth_service.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/core/services/snackbar/snack_bar_service.dart';
import '/locator.dart';
import '../../../../core/models/user/user.dart';
import '../../../router.gr.dart';

class CustomerDrawerMenuViewModel extends BaseViewModel {
  User? user = locator<KeyStorageService>().user;

  Future<void> init() async {
    notifyListeners();
  }

  void moveToAbout(BuildContext context) {
    Navigator.of(context).pop();
    if (AboutViewRoute.name != ModalRoute.of(context)!.settings.name) {
      locator<NavigationService>().pushReplacementNamed(AboutViewRoute());
    }
  }

  void moveToLogin(BuildContext context) {
    if (!locator<PermissionsService>().isLoggedIn) {
      locator<NavigationService>().pushReplacementNamed(LoginViewRoute());
    }
  }

  Future<void> signOut(BuildContext context) async {
    await locator<AuthService>().signOut(context);
  }

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
    locator<NavigationService>().pushReplacementNamed(
      MainViewRoute(),
    );
  }

  final SnackBarService? _snackBarService = locator<SnackBarService>();

  Future<void> showSnackbar(
      String message, Color color, BuildContext context) async {
    _snackBarService!.showSnackBarMessage(message, 3, color, context);
  }
}
