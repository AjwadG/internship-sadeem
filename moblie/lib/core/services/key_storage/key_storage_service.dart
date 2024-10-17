import 'package:internship/core/models/meta/meta.dart';
import 'package:internship/core/models/user/user.dart';

abstract class KeyStorageService {
  void remove(String key);

  void removeEveryThing();

  dynamic getFromDisk(String key);

  void saveToDisk<T>(String key, T content);

  bool? hasVibrationEnabled;
  bool? isNotification;
  bool? isFirstOpen;
  bool? isFirstFetchOfCachedStuff;
  bool? isDark;
  bool? isDarkModeChangeable;
  String? token;
  String? locale;
  User? user;
  Meta? meta;
  String? about;
  String? minimum_order;
  String? appVersion;
  String? pagination;

}
