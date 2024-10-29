import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../ui/router.dart';

/// Service that is responsible for navigating around the app
class NavigationService {
  Future<dynamic> pushNamed(PageRouteInfo route, {Object? arguments}) {
    return locator<AppRouter>().push(route);
  }

  Future<dynamic> pushReplacementNamed(PageRouteInfo route,
      {Object? arguments}) {
    return locator<AppRouter>().replace(route);
  }

  Future popAllAndPushNamed(PageRouteInfo route, {Object? arguments}) {
    locator<AppRouter>().popUntilRoot();

    return locator<AppRouter>().replace(route);
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future navigateNamedTo(BuildContext context, String path) {
    return context.navigateNamedTo(path);
  }

  bool canNavigateBack(BuildContext context) {
    return locator<AppRouter>().canNavigateBack;
  }
}
