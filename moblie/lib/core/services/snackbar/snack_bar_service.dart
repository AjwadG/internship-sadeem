import 'package:flutter/material.dart';

import '/core/models/snack_bar_response/snack_bar_response.dart';

abstract class SnackBarService {
  //Future<SnackBarResponse> showSnackBar(SnackBarRequest alertRequest);
  void showSnackBarMessage(String text, int duration, Color color,
      [BuildContext context]);

  void completeSnackBar(SnackBarResponse response, BuildContext context);
}
