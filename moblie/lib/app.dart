import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:internship/provider_setup.dart';
import 'package:internship/ui/router.dart';
import 'package:internship/ui/shared/themes.dart';
import 'core/services/key_storage/key_storage_service.dart';
import 'generated/l10n.dart';
import 'locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<Widget> initializeApp() async {
  return MyApp();
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  static BuildContext? context;
  Locale local = Locale('ar', '');
  static ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifier,
      builder: (_, mode, __) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp.router(
            // builder: OneContext().builder,
            routerConfig: router.config(),
            onGenerateTitle: (BuildContext context) {
              return 'internship App';
            },
            title: 'internship App',
            debugShowCheckedModeBanner: false,
            theme: primaryMaterialTheme,
            darkTheme: darkMaterialTheme,
            themeMode: locator<KeyStorageService>().isDark!
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: local,
            localizationsDelegates: [
              AppLocalizations.delegate,
              FormBuilderLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar'),
              Locale('en'), // English, no country code
            ]
            //+FormBuilderLocalizations.delegate.supportedLocales
            ,
            // ignore: body_might_complete_normally_nullable
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              //myLocale = deviceLocale ; // here you make your app language similar to device language , but you should check whether the localization is supported by your app
            },
          ),
        );
      },
    );
  }
}
