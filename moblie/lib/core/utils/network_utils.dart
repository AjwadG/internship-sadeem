import 'dart:async';
import 'dart:convert' as convert;

import 'package:dio/dio.dart';

// ignore: library_prefixes
import 'package:flutter/material.dart';
import 'package:internship/core/services/navigation/navigation_service.dart';

import '../../ui/router.dart';
import '/core/exceptions/auth_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/server_exception.dart';
import '/core/exceptions/token_expired_exception.dart';
import '/core/exceptions/unauthorized_exception.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '../../locator.dart';
import '../../ui/router.gr.dart';

Future<void> checkForNetworkExceptions(
    Response response, bool is_error_dialog) async {
  if (response.data != null) {
    if (response.statusCode! >= 400 && response.statusCode! < 500) {
      var errors = '';
      if (response.statusCode! == 403 && response.data['message'] != null) {}
      if (response.data['errors'] != null) {
        try {
          var values = response.data['errors'] as Map<String, dynamic>;

          if (values.keys.isNotEmpty) {
            for (var key in values.keys) {
              errors = errors + ' ' + key + ' ' + values[key].toString() + '\n';
            }
          }
        } catch (e) {
          var values = response.data['errors'] as List;

          if (values.isNotEmpty) {
            values.forEach((element) {
              errors = errors + ' ' + element.toString() + '\n';
            });
          }
        }

        errors = errors.replaceAll('message', '');

        print('errors' + errors);
      }

      if (is_error_dialog) {
        await showDialog(
          builder: (_) => AlertDialog(
            title: Text('تنويه!'),
            content: SingleChildScrollView(child: Text(response.toString())),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              ElevatedButton(
                child: Text('موافق'),
                onPressed: () {
                  Navigator.pop(locator
                      .get<AppRouter>()
                      .navigatorKey
                      .currentState!
                      .context);

                  return;
                },
              ),
            ],
          ),
          context: locator.get<AppRouter>().navigatorKey.currentState!.context,
        );
      }

      if (response.statusCode == 403) {
        locator<KeyStorageService>().remove('token');
        locator<KeyStorageService>().remove('user_key');
        locator<KeyStorageService>().remove('user_fcm_token');
        locator<KeyStorageService>().removeEveryThing();
        await showDialog(
          builder: (_) => AlertDialog(
            title: Text('تنويه!'),
            content: SingleChildScrollView(child: Text(response.toString())),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              ElevatedButton(
                child: Text('موافق'),
                onPressed: () {
                  Navigator.pop(locator
                      .get<AppRouter>()
                      .navigatorKey
                      .currentState!
                      .context);

                  return;
                },
              ),
            ],
          ),
          context: locator.get<AppRouter>().navigatorKey.currentState!.context,
        );

        unawaited(locator<NavigationService>()
            .pushReplacementNamed(StartUpViewRoute()));
      }

      return;
    }
  } else {
    if (response.statusCode == 401) {
      throw UnauthorizedException('Unauthorized user Error');
    }

    if (response.statusCode == 403) {
      throw UnauthorizedException('UnauthorizedAccess user Error');
    }

    if (response.statusCode == 500) {
      print('Server Error');
      throw ServerException('Server Error');
    }

    if (response.statusCode != 200) {
      throw NetworkException('Failed to connect to internet');
    }
  }
}

Future<void> AuthCheck(jsonData) async {
  if (jsonData is Map<String, dynamic>) {
    if (jsonData.containsKey('code')) {
      if (jsonData['code'] == 3009) {
        throw AuthException('Token not provided');
      }
    }

    if (jsonData.containsKey('code')) {
      if (jsonData['code'] == 3010) {
        await logout();
        throw TokenExpiredException('Token expired');
      }
    }
    if (jsonData.containsKey('code')) {
      if (jsonData['code'] == 3011) {
        await logout();
        throw TokenExpiredException('Token invalid');
      }
    }
  }
}

Future<void> logout() async {
  locator<KeyStorageService>().remove('token');
  locator<KeyStorageService>().removeEveryThing();

  // await _navigationService.popAllAndPushNamed(LoginOnlyViewRoute(),context);
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    //debugPrint('${(received / total * 100).toStringAsFixed(0)}%');
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    debugPrint('Network Utils: Failed to decode response body ${e.message}');
    throw NetworkException(e.message);
  }
}
