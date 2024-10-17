// ignore_for_file: prefer_single_quotes, unnecessary_null_comparison, omit_local_variable_types, deprecated_member_use, curly_braces_in_flow_control_structures

import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internship/core/models/alert_request/confirm_alert_request.dart';
import 'package:internship/core/services/dialog/dialog_service.dart';
import 'package:internship/core/services/key_storage/key_storage_service.dart';
import 'package:internship/generated/l10n.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/constant/asset_images.dart';
import '/core/constant/constants.dart';
import '../../locator.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

const defaultPadding = 16.0;

class Helper {
  Helper._();

  static ValueNotifier<bool> notifier = ValueNotifier<bool>(true);

  static String time_24_to_12(String? date, String time) {
    Intl.defaultLocale = 'en';

    // This is
    var t = time.split(':')[1];

    if (t.length != 2) {
      time = time + '0';
    }

    var value = DateTime.parse('$date $time');

    return DateFormat('h:mma').format(value).toString();
  }

  static String DateTimeToString(DateTime inputDate, schema) {
    var outputFormat = DateFormat(schema, 'en');
    var outputDate =
        outputFormat.format(inputDate.toLocal()); // <-- Desired date
    return outputDate.toString();
  }

  static String removeTimeAgo(String time) {
    String substrAr = "منذ";
    String substrEn = "ago";
    String replacement = " ";
    time = time.replaceFirst(substrAr, replacement);
    time = time.replaceFirst(substrEn, replacement);
    return time;
  }

  static String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  static Future<void> openURL(String url) async {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  static DateTime StringToDateTimeObject(String date, schema) {
    var inputFormat = DateFormat(schema, 'en');
    var inputDate = inputFormat.parse(date);
    return inputDate;
  }



  static void topSnackBar(String msg, BuildContext context, String type) {
    switch (type) {
      case Constants.TYPE_SUCCESS:
        {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: msg,
              icon: Container(),
            ),
          );
          break;
        }
      case Constants.TYPE_INFO:
        {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.info(message: msg, icon: Container()),
          );
          break;
        }
      case Constants.TYPE_ERROR:
        {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: msg, icon: Container()),
          );
          break;
        }
    }
  }


  static String checkIfNull(
      {required String? value, required String defaultText}) {
    try {
      if (value == 'null') {
        return defaultText;
      }
      if (value != null) {
        return value;
      }
    } catch (e) {
      return defaultText;
    }
    return defaultText;
  }

  static StrutStyle buildStrutStyle(TextStyle? textStyle) {
    return StrutStyle(
      forceStrutHeight: true,
      fontWeight: textStyle?.fontWeight,
      fontSize: textStyle?.fontSize,
      fontFamily: textStyle?.fontFamily,
      fontStyle: textStyle?.fontStyle,
      fontFamilyFallback: textStyle?.fontFamilyFallback,
      debugLabel: textStyle?.debugLabel,
    );
  }





  static String displayTime(DateTime dateTime) {
    timeago.setLocaleMessages(
        'ar', timeago.ArMessages()); // Add french messages

    var diff = DateTime.now().difference(dateTime);

    if (diff.inMinutes < 1440) {
      return timeago.format(dateTime, locale: 'ar');
    } else {
      return DateTimeToString(dateTime, 'yyyy-MM-dd');
    }
  }



  static String cleanHTTP(String url) {
    if (!url.startsWith('www.') && !url.startsWith('https://')) {
      url = 'www.' + url;
    }
    if (!url.startsWith('https://')) {
      url = 'https://' + url;
    }
    return url;
  }

  static String DeliveryTimeToString(String? time) {
    if (time == 'morning') return 'صباحاً';
    if (time == 'afternoon') return 'مساءً';
    if (time == 'night') return 'ليلاً';
    if (time == 'evening') return 'ليلاً';

    return time!;
  }


}

