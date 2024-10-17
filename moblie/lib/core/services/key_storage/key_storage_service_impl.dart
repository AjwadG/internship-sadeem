// ignore_for_file: annotate_overrides, override_on_non_overriding_member

import 'package:internship/core/models/meta/meta.dart';
import 'package:internship/core/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/constant/constants.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/ui/shared/helper.dart';

/// Service that is responsible for storing/retrieving data in/from
/// local storage using the [SharedPreferences] package.
///
///

class KeyStorageServiceImpl implements KeyStorageService {
  static const locale_key = 'locale_key';
  static const ad_notifications_key = 'notifications_key';
  static const vendor_notifications_key = 'vendor_notifications_key';
  static const driver_notifications_key = 'driver_notifications_key';
  static const vibration__key = 'vibration__key';
  static const is_logged_in_key = 'is_logged_in_key';
  static const user_token_key = 'token';
  static const user_fcm_token = 'user_fcm_token';
  static const user_key = 'user_key';
  static const cart_key = 'cart_key';
  static const meta_key = 'meta_key';

  // static const setting = 'setting';
  static const vendor_key = 'vendor_key';
  static const isFirstOpen_key = 'isFirstOpen_key';
  static const isBackgroundPermissionGranted_key =
      'isBackgroundPermissionGranted_key';
  static const isBackgroundLocationAccepted_key =
      'isBackgroundLocationAccepted_key';

  static const is_first_fetch_of_cached_stuff_key =
      'is_first_fetch_of_cached_stuff_key';
  static const last_fetch_of_cached_stuff_time_key =
      'last_fetch_of_cached_stuff_time_key';
  static const is_dark_key = 'is_dark_key';
  static const is_multi_vendor_key = 'is_multi_vendor_key';
  static const is_wallet_enabled_key = 'is_wallet_enabled_key';
  static const is_dark_mode_changeable_key = 'is_dark_mode_changeable_key';
  static const minimum_order_key = 'minimum_order';
  static const google_map_api_key = 'google_map_api_key';
  static const appName_key = 'app_name';
  static const appNameVersionKey = 'app_version';
  static const about_key = 'about';
  static const pagination_key = 'pagination';

  static const items_category_key = 'items_category_key';
  static const recent_phone_number = 'recentPhoneNumber';
  static KeyStorageServiceImpl? _instance;
  static SharedPreferences? _preferences;
  static const path_type = 'pathType';

  static Future<KeyStorageServiceImpl?> getInstance() async {
    _instance ??= KeyStorageServiceImpl();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance;
  }

  @override
  set recentPhoneNumber(String? value) {
    saveToDisk(recent_phone_number, value);
  }

  @override
  String get recentPhoneNumber => getFromDisk(recent_phone_number) ?? '';

  @override
  set pathType(String? value) {
    saveToDisk(path_type, value);
  }

  @override
  String get pathType => getFromDisk(path_type) ?? '';

  bool get hasVendorNotificationsEnabled =>
      getFromDisk(vendor_notifications_key) ?? true;

  @override
  String get locale => getFromDisk(locale_key) ?? '';

  @override
  bool get hasVibrationEnabled => getFromDisk(vibration__key) ?? true;

  @override
  set hasVibrationEnabled(bool? value) => saveToDisk(vibration__key, value);

  @override
  bool get isFirstOpen => getFromDisk(isFirstOpen_key) ?? true;

  @override
  bool get isBackgroundPermissionGranted =>
      getFromDisk(isBackgroundPermissionGranted_key) ?? false;

  @override
  bool get isBackgroundLocationAccepted =>
      getFromDisk(isBackgroundLocationAccepted_key) ?? false;

  @override
  bool get isFirstFetchOfCachedStuff =>
      getFromDisk(is_first_fetch_of_cached_stuff_key) ?? true;

  @override
  bool get isNotification => getFromDisk(ad_notifications_key) ?? true;

  @override
  bool get isMultiVendor => getFromDisk(is_multi_vendor_key) ?? false;

  @override
  set isMultiVendor(bool? value) => saveToDisk(is_multi_vendor_key, value);

  @override
  bool get isDarkModeChangeable =>
      getFromDisk(is_dark_mode_changeable_key) ?? false;

  @override
  set isDarkModeChangeable(bool? value) =>
      saveToDisk(is_dark_mode_changeable_key, value);

  @override
  set isFirstOpen(bool? value) => saveToDisk(isFirstOpen_key, value);

  @override
  set isBackgroundPermissionGranted(bool? value) =>
      saveToDisk(isBackgroundPermissionGranted_key, value);

  @override
  set isBackgroundLocationAccepted(bool? value) =>
      saveToDisk(isBackgroundLocationAccepted_key, value);

  @override
  set isNotification(bool? value) => saveToDisk(ad_notifications_key, value);

  @override
  set isFirstFetchOfCachedStuff(bool? value) =>
      saveToDisk(is_first_fetch_of_cached_stuff_key, value);

  @override
  set locale(String? _user_token) {
    saveToDisk(locale_key, _user_token);
  }

  @override
  DateTime? get last_fetch_of_cached_stuff_time {
    if (getFromDisk(last_fetch_of_cached_stuff_time_key) == null) {
      return DateTime.now().subtract(Duration(days: 1));
    } else {
      return DateTime.parse(getFromDisk(last_fetch_of_cached_stuff_time_key));
    }
  }

  @override
  set last_fetch_of_cached_stuff_time(DateTime? value) =>
      saveToDisk(last_fetch_of_cached_stuff_time_key, value.toString());

  @override
  set isDark(bool? value) => saveToDisk(is_dark_key, value);

  @override
  bool get isDark => getFromDisk(is_dark_key) ?? false;

  @override
  User? get user {
    if (getFromDisk(user_key) == null) {
      return null;
    }
    return User.fromJson(getFromDisk(user_key));
  }

  @override
  set user(User? value) => saveToDisk(user_key, value!.toJson());

  @override
  String get minimum_order => getFromDisk(minimum_order_key) ?? '0';

  @override
  set minimum_order(String? minimum_order) =>
      saveToDisk(minimum_order_key, minimum_order);

  @override
  String get appVersion => getFromDisk(appNameVersionKey) ?? '1.0';


  @override
  String get about =>
      Helper.cleanHTTP(getFromDisk(about_key) ?? Constants.ABOUT);

  @override
  String get pagination => getFromDisk(pagination_key) ?? '';


  @override
  set pagination(String? pagination) {
    saveToDisk(pagination_key, pagination);
  }

  @override
  set appVersion(String? pagination) {
    saveToDisk(appNameVersionKey, pagination);
  }

  @override
  String get token => getFromDisk(user_token_key) ?? '';

  @override
  String get fcm_token => getFromDisk(user_fcm_token) ?? '';

  @override
  set token(String? _user_token) {
    saveToDisk(user_token_key, _user_token);
  }

  @override
  set fcm_token(String? _user_token) {
    saveToDisk(user_fcm_token, _user_token);
  }

  @override
  Meta? get meta {
    if (getFromDisk(meta_key) == null) {
      return null;
    }
    return Meta.fromJson(getFromDisk(meta_key));
  }

  @override
  set about(String? token) {
    saveToDisk(about_key, token);
  }

  @override
  dynamic getFromDisk(String key) {
    final value = _preferences!.get(key);

    //  _log.finest('LocalStorageService: (Fetching) key: $key value: $value');

    return value;
  }

  @override
  void saveToDisk<T>(String key, T content) {
    //  _log.finest('LocalStorageService: (Saving) key: $key value: $content');
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }

  @override
  void remove(String key) {
    // print(key);

    _preferences!.remove(key);
  }

  @override
  Future<void> removeEveryThing() async {
    _preferences ??= await SharedPreferences.getInstance();

    await _preferences!.clear();
    // remove everything!
  }

  @override
  set meta(Meta? value) => saveToDisk(meta_key, value!.toJson());
}
