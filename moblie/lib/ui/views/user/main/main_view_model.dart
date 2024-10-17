import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/constant/api_routes.dart';

import '../../../../core/enums/http_request_type.dart';

import '../../../../core/models/user/user.dart';
import '../../../../core/repositories/magical_repository.dart';
import '../../../../core/services/key_storage/key_storage_service.dart';

import '../../../../locator.dart';

class MainViewModel extends BaseViewModel {
  BuildContext? context;
  User? user;

  String q = '';

  Future<void> init(
    BuildContext context,
  ) async {
    this.context = context;
    setBusy(true);

    setBusy(false);
  }

  void search(String text) {
    q = text;
    notifyListeners();
  }
}
