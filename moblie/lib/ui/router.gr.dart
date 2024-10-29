// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:internship/core/models/vendor/vendor.dart' as _i9;
import 'package:internship/ui/views/auth/login/login_view.dart' as _i2;
import 'package:internship/ui/views/auth/signup/signup_viewl.dart' as _i4;
import 'package:internship/ui/views/startup/start_up_view.dart' as _i5;
import 'package:internship/ui/views/user/about/about_view.dart' as _i1;
import 'package:internship/ui/views/user/main/main_view.dart' as _i3;
import 'package:internship/ui/views/user/vendor/vendor_view.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AboutViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AboutView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginView(),
      );
    },
    MainViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MainView(),
      );
    },
    SignUpViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    StartUpViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.StartUpView(),
      );
    },
    VendorViewRoute.name: (routeData) {
      final args = routeData.argsAs<VendorViewRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.VendorView(
          key: args.key,
          vendor: args.vendor,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutView]
class AboutViewRoute extends _i7.PageRouteInfo<void> {
  const AboutViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AboutViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginView]
class LoginViewRoute extends _i7.PageRouteInfo<void> {
  const LoginViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainView]
class MainViewRoute extends _i7.PageRouteInfo<void> {
  const MainViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpView]
class SignUpViewRoute extends _i7.PageRouteInfo<void> {
  const SignUpViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.StartUpView]
class StartUpViewRoute extends _i7.PageRouteInfo<void> {
  const StartUpViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          StartUpViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartUpViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.VendorView]
class VendorViewRoute extends _i7.PageRouteInfo<VendorViewRouteArgs> {
  VendorViewRoute({
    _i8.Key? key,
    required _i9.Vendor vendor,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          VendorViewRoute.name,
          args: VendorViewRouteArgs(
            key: key,
            vendor: vendor,
          ),
          initialChildren: children,
        );

  static const String name = 'VendorViewRoute';

  static const _i7.PageInfo<VendorViewRouteArgs> page =
      _i7.PageInfo<VendorViewRouteArgs>(name);
}

class VendorViewRouteArgs {
  const VendorViewRouteArgs({
    this.key,
    required this.vendor,
  });

  final _i8.Key? key;

  final _i9.Vendor vendor;

  @override
  String toString() {
    return 'VendorViewRouteArgs{key: $key, vendor: $vendor}';
  }
}
