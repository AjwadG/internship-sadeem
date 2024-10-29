import 'package:flutter/material.dart';

import '/core/models/alert_request/alert_request.dart';
import '/core/models/alert_response/confirm_alert_response.dart';

abstract class DialogService {
  Future<ConfirmAlertResponse> showDialog(
      AlertRequest alertRequest, BuildContext context);

  void completeDialog(ConfirmAlertResponse response, BuildContext context);
}
