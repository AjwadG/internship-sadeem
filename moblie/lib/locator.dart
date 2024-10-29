import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internship/core/services/auth/auth_service.dart';
import 'package:internship/core/services/auth/auth_service_impl.dart';
import 'package:internship/core/services/connectivity/connectivity_service.dart';
import 'package:internship/core/services/connectivity/connectivity_service_impl.dart';
import 'package:internship/core/services/http/http_service.dart';
import 'package:internship/core/services/http/http_service_impl.dart';
import 'package:internship/core/services/key_storage/key_storage_service.dart';
import 'package:internship/core/services/key_storage/key_storage_service_impl.dart';
import 'package:internship/core/services/navigation/navigation_service.dart';
import 'package:internship/core/services/snackbar/snack_bar_service.dart';
import 'package:internship/core/services/snackbar/snack_bar_service_impl.dart';
import 'package:internship/core/utils/file_helper.dart';
import 'package:internship/ui/router.dart';
import 'core/data_sources/magical_remote_data_source.dart';
import 'core/repositories/magical_repository.dart';
import 'core/services/dialog/dialog_service.dart';
import 'core/services/dialog/dialog_service_impl.dart';
import 'core/services/permissions/permissions_service.dart';
import 'core/services/permissions/permissions_service_impl.dart';


GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.

Future<void> setupLocator() async {
  // Services

  await _setupSharedPreferences();

  locator.registerLazySingleton(() => NavigationService());

  locator.registerSingleton<AppRouter>(AppRouter());

  locator.registerLazySingleton<PermissionsService>(
    () => PermissionsServiceImpl(),
  );

  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );

  locator.registerLazySingleton<MagicalRemoteDataSource>(
    () => MagicalRemoteDataSourceImpl(),
  );
  locator
      .registerLazySingleton<MagicalRepository>(() => MagicalRepositoryImpl());

  locator.registerLazySingleton<DialogService>(() => DialogServiceImpl());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  // Data sources

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());

  // External
  // locator.registerLazySingleton<HiveInterface>(() => Hive);


}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance!);
}
