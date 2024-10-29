// ignore: library_prefixes
// ignore_for_file: library_prefixes, duplicate_ignore
import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import '../../../ui/router.dart';
import '../permissions/permissions_service.dart';
import '../snackbar/snack_bar_service.dart';
import '/core/constant/api_routes.dart';
import '/core/exceptions/auth_exception.dart';
import '/core/exceptions/unauthorized_exception.dart';
import '/core/models/alert_request/confirm_alert_request.dart';
import '/core/models/user/user.dart';
import '/core/services/auth/auth_service.dart';
import '/core/services/connectivity/connectivity_service.dart';
import '/core/services/dialog/dialog_service.dart';
import '/core/services/http/http_service.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';
import '/ui/router.gr.dart';

class AuthServiceImpl implements AuthService {
  final _log = Logger('AuthServiceImpl');
  final connectivityService = locator<ConnectivityService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final httpService = locator<HttpService>();

  User? _currentUser;

  @override
  User get currentUser => _currentUser!;

  @override
  Future<bool?> loginWithEmail(Map<String, String> parameters) async {
    try {
      Map<String, dynamic> jsonData = await httpService.postHttpForm(
          ApiRoutes.login, parameters, [], false);

      if (jsonData.containsKey('token')) {
        print('AuthServiceImpl.loginWithEmail');
        locator<KeyStorageService>().token = jsonData['token'];

        return true;
      }
    } on UnauthorizedException {
      // _log.severe('UnauthorizedException: Error signing up');
      throw UnauthorizedException('Error Unauthorized');
    } on Exception {
      // _log.severe('AuthService: Error signing up');
      throw AuthException('Error signing up');
    }

    return false;
  }

  @override
  Future<void> signOut(BuildContext context) async {
    final alertRequest = ConfirmAlertRequest(
      (r) => r
        ..title = ''
        ..description = 'هل انت متاكد من رغبتك بتسجيل الخروج؟'
        ..buttonCancelTitle = 'لا'
        ..buttonConfirmTitle = 'نعم', //
    );

    var dialogResult = await (_dialogService.showDialog(alertRequest, context));

    if (dialogResult.confirmed) {
      // unawaited(httpService.getHttp(ApiRoutes.user_logout, {}));

      locator<KeyStorageService>().remove('token');
      locator<KeyStorageService>().remove('user_key');
      locator<KeyStorageService>().remove('user_fcm_token');
      AutoRouter.of(context).back();

      _currentUser = null;

      unawaited(_navigationService.pushReplacementNamed(StartUpViewRoute()));
    }
  }

  @override
  Future<bool> signUp(Map<String, String> parameters) async {
    try {
      // authenticate with server
      Map<String, dynamic> jsonData =
          await httpService.postHttp(ApiRoutes.register, parameters, false);
      if (jsonData.containsKey('token')) {
        locator<KeyStorageService>().token = jsonData['token'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _log.shout(e);
      _log.severe('AuthService: Error signing up');

      throw AuthException('Error signing up');
    }
  }
}
