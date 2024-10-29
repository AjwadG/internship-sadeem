import 'package:auto_route/auto_route.dart';
import 'package:internship/ui/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View', generateForDir: ['lib'])
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: StartUpViewRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginViewRoute.page,
          path: '/login',
        ),
        AutoRoute(page: AboutViewRoute.page),
        AutoRoute(
          page: MainViewRoute.page,
        ),
        AutoRoute(
          page: SignUpViewRoute.page,
        ),
        AutoRoute(
          page: VendorViewRoute.page,
        ),
      ];
}
