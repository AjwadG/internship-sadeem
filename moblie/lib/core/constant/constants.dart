import 'package:flutter/foundation.dart';

class Constants {
  static const bool isDebugModeOn = !kReleaseMode;

  //apis
  //Customization
  static const List<int> available_pagination_sizes = [12, 24, 48];
  static int default_pagination_size = 12;

  //settings
  static const bool isHttpLogON = true;

  //TopSnackBar type
  static const String TYPE_SUCCESS = 'success';
  static const String TYPE_ERROR = 'error';
  static const String TYPE_INFO = 'info';

  //Colors and Theme
  static String app_color_primary = '774494';
  static String app_color_on_primary = '000000';
  static String app_color_primary_variant = '78539f';
  static String app_color_secondary = 'cb297b';
  static String app_color_on_secondary = 'ffffff';

  static String ABOUT = '';

  static String app_font_name = 'Almarai';

  static const String SADEEM_ABOUT =
      'هذا التطبيق مبرمج من قبل شركة سديم التقنية المتخصصة في صناعة البرمجيات وتصميم المواقع الإلكترونية';

  static const int LOGO_FILE_TYPE = 1;
  static const int LOGO_SVG_TYPE = 2;
  static const int LOGO_URL_TYPE = 3;

  static const int HIVE_TYPE_ID_ORDERS = 1;
  static const int HIVE_TYPE_ID_VENDOR_CATEGORIES_ITEMS = 2;
  static const int HIVE_TYPE_ID_BANNERS = 3;
  static const int HIVE_TYPE_ID_VENDOR_ITEM = 4;
  static const int HIVE_TYPE_ID_UNITS = 5;
  static const int HIVE_TYPE_ID_IMAGE = 6;

  // ROLES
  // all are numerical values now
  static const int RULE_CUSTOMER = 3;
  static const int RULE_DRIVER = 4;

  static const String DEFAULT_SORTS = '-created_at';
}
