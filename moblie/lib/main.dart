import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internship/logger.dart';
import 'app.dart';
import 'locator.dart';

void main() async {
  var app = await initializeApp();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    setupLogger();
    runApp(app);
  }, (Object error, StackTrace stack) async {
    print(stack);
    print(error);
  });
}
