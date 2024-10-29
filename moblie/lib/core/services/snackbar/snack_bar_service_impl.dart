// ignore_for_file: unused_field

import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '/core/constant/constants.dart';
import '/core/models/snack_bar_response/snack_bar_response.dart';
import '/core/services/navigation/navigation_service.dart';
import '/core/services/snackbar/snack_bar_service.dart';
import '/locator.dart';

/// A service that is responsible for returning future snackbar
class SnackBarServiceImpl implements SnackBarService {
  final _log = Logger('SnackBarServiceImpl');

  Completer<SnackBarResponse>? _snackBarCompleter;

  @override
  void completeSnackBar(SnackBarResponse response, BuildContext context) {
    locator<NavigationService>().pop(context);
    _snackBarCompleter!.complete(response);
    _snackBarCompleter = null;
  }

  @override
  void showSnackBarMessage(String text, int duration, Color color,
      [BuildContext? context]) {
    Flushbar(
      message: text,
      duration: Duration(seconds: duration != null ? duration : 3),
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context!);
  }
// @override
// void showSnackBarMessage(String text, int duration, Color color,
//     [BuildContext? context]) {
//   /*  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
//     content: Text('Yay! A SnackBar!'),
//   ));*/
//
//   ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
//     action: SnackBarAction(
//       label: '',
//       onPressed: () {
//         // Code to execute.
//       },
//     ),
//     backgroundColor: color,
//     content: Text(
//       text,
//       style: TextStyle(
//         color: Colors.white,
//         fontFamily: Constants.app_font_name,
//       ),
//     ),
//     duration: Duration(seconds: duration),
//     //width: MediaQuery.of(context).size.width,
//     // Width of the SnackBar.
//     padding: const EdgeInsets.symmetric(
//         horizontal: 8.0, // Inner padding for SnackBar content.
//         vertical: 8.0),
//     behavior: SnackBarBehavior.fixed,
//
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10.0),
//     ),
//   ));
// }
}
