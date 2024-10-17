import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:internship/ui/shared/ui_helper.dart';
import '../../../locator.dart';
import '../../../ui/router.dart';
import '/core/models/alert_request/alert_request.dart';
import '/core/models/alert_request/confirm_alert_request.dart';
import '/core/models/alert_response/confirm_alert_response.dart';
import '/core/services/dialog/dialog_service.dart';
import '../../constant/constants.dart';

class DialogServiceImpl implements DialogService {
  final _log = Logger('DialogServiceImpl');

  late Completer<ConfirmAlertResponse> _dialogCompleter;

  @override
  Future<ConfirmAlertResponse> showDialog(
      AlertRequest request, BuildContext context) {
    _dialogCompleter = Completer<ConfirmAlertResponse>();

    if (request is ConfirmAlertRequest) {
      _log.finer('showConfirmAlert');
      _showConfirmAlert(request, context);
    }

    return _dialogCompleter.future;
  }

  @override
  void completeDialog(ConfirmAlertResponse response, BuildContext context) {
    _dialogCompleter.complete(response);
  }

  Future<void> _showConfirmAlert(
      ConfirmAlertRequest request, BuildContext t) async {
    await showGeneralDialog(
        context: t,
        pageBuilder: (BuildContext ss, Animation animation,
            Animation secondaryAnimation) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                    Text(
                      request.description,
                      style: TextStyle(fontFamily: Constants.app_font_name),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        if (request.buttonCancelTitle.isNotEmpty)
                          ElevatedButton(
                              onPressed: () async {
                                Navigator.of(locator
                                        .get<AppRouter>()
                                        .navigatorKey
                                        .currentState!
                                        .context)
                                    .pop();
                                completeDialog(
                                    ConfirmAlertResponse(
                                        (a) => a..confirmed = false),
                                    t);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(t).colorScheme.primary,
                                minimumSize: Size(100, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                request.buttonCancelTitle,
                                style: TextStyle(
                                    fontSize: 15,
                                    height: 0.9,
                                    fontFamily: Constants.app_font_name),
                              )),
                        if (request.buttonConfirmTitle.isNotEmpty)
                          ElevatedButton(
                              onPressed: () async {
                                Navigator.of(locator
                                        .get<AppRouter>()
                                        .navigatorKey
                                        .currentState!
                                        .context)
                                    .pop();

                                completeDialog(
                                    ConfirmAlertResponse(
                                        (a) => a..confirmed = true),
                                    t);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Theme.of(t).colorScheme.primary,
                                minimumSize: Size(100, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                request.buttonConfirmTitle,
                                style: TextStyle(
                                    fontSize: 15,
                                    height: 0.9,
                                    fontFamily: Constants.app_font_name),
                              )),
                      ],
                    ),
                    UIHelper.verticalSpaceMedium(),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
