// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `مرحباً {firstName}`
  String pageHomeTitle(Object firstName) {
    return Intl.message(
      'مرحباً $firstName',
      name: 'pageHomeTitle',
      desc: 'هذا فقط مجرد مثال لشرح قدرة الترجمة على وضع نصوصو بديلة ',
      args: [firstName],
    );
  }

  /// `لم تحدد`
  String get undefined {
    return Intl.message(
      'لم تحدد',
      name: 'undefined',
      desc: '',
      args: [],
    );
  }

  /// `عدد الطلبات الحالية`
  String get number_of_trips {
    return Intl.message(
      'عدد الطلبات الحالية',
      name: 'number_of_trips',
      desc: '',
      args: [],
    );
  }

  /// `الهدف`
  String get target {
    return Intl.message(
      'الهدف',
      name: 'target',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get general_confirm {
    return Intl.message(
      'تأكيد',
      name: 'general_confirm',
      desc: '',
      args: [],
    );
  }

  /// `اضافة`
  String get add {
    return Intl.message(
      'اضافة',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get about_app {
    return Intl.message(
      'عن التطبيق',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `ذكر`
  String get general_gender_male {
    return Intl.message(
      'ذكر',
      name: 'general_gender_male',
      desc: '',
      args: [],
    );
  }

  /// `انثى`
  String get general_gender_female {
    return Intl.message(
      'انثى',
      name: 'general_gender_female',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get user_profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن تعديل رقم الهاتف`
  String get phone_number_isnt_editable {
    return Intl.message(
      'لا يمكن تعديل رقم الهاتف',
      name: 'phone_number_isnt_editable',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get name {
    return Intl.message(
      'الاسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get phone {
    return Intl.message(
      'الهاتف',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `حدد الخيار`
  String get choose_one {
    return Intl.message(
      'حدد الخيار',
      name: 'choose_one',
      desc: '',
      args: [],
    );
  }

  /// `الجنس`
  String get gender {
    return Intl.message(
      'الجنس',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `التعديل`
  String get edit {
    return Intl.message(
      'التعديل',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `إرسال`
  String get send {
    return Intl.message(
      'إرسال',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `وقت المتبقي للوصول`
  String get expected_time {
    return Intl.message(
      'وقت المتبقي للوصول',
      name: 'expected_time',
      desc: '',
      args: [],
    );
  }

  /// `موافق`
  String get accept {
    return Intl.message(
      'موافق',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `توقف`
  String get stop {
    return Intl.message(
      'توقف',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `النجدة`
  String get sos_send_help {
    return Intl.message(
      'النجدة',
      name: 'sos_send_help',
      desc: '',
      args: [],
    );
  }

  /// `تم الإرسال`
  String get sent_confirmation {
    return Intl.message(
      'تم الإرسال',
      name: 'sent_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `د.ل`
  String get general_lyd {
    return Intl.message(
      'د.ل',
      name: 'general_lyd',
      desc: '',
      args: [],
    );
  }

  /// `تقييم الطلب`
  String get order_rate {
    return Intl.message(
      'تقييم الطلب',
      name: 'order_rate',
      desc: '',
      args: [],
    );
  }

  /// `شحن المحفظة`
  String get charge_the_wallet {
    return Intl.message(
      'شحن المحفظة',
      name: 'charge_the_wallet',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get view_phone {
    return Intl.message(
      'رقم الهاتف',
      name: 'view_phone',
      desc: '',
      args: [],
    );
  }

  /// `التكلفة`
  String get purchase_price {
    return Intl.message(
      'التكلفة',
      name: 'purchase_price',
      desc: '',
      args: [],
    );
  }

  /// `خطأ بالقيمة`
  String get wrong_value {
    return Intl.message(
      'خطأ بالقيمة',
      name: 'wrong_value',
      desc: '',
      args: [],
    );
  }

  /// `تم شحن المحفظة`
  String get wallet_charging_confirmed {
    return Intl.message(
      'تم شحن المحفظة',
      name: 'wallet_charging_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إدخال القيمة`
  String get please_enter_the_value {
    return Intl.message(
      'الرجاء إدخال القيمة',
      name: 'please_enter_the_value',
      desc: '',
      args: [],
    );
  }

  /// `المحفظة`
  String get wallet {
    return Intl.message(
      'المحفظة',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ`
  String get date {
    return Intl.message(
      'تاريخ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `الوسيلة`
  String get payment_method_name {
    return Intl.message(
      'الوسيلة',
      name: 'payment_method_name',
      desc: '',
      args: [],
    );
  }

  /// `الرصيد الحالي`
  String get current_funds {
    return Intl.message(
      'الرصيد الحالي',
      name: 'current_funds',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get main_view_home {
    return Intl.message(
      'الرئيسية',
      name: 'main_view_home',
      desc: '',
      args: [],
    );
  }

  /// `تدريب سديم الصيفي لسنة 2024`
  String get sadeem_info {
    return Intl.message(
      'تدريب سديم الصيفي لسنة 2024',
      name: 'sadeem_info',
      desc: '',
      args: [],
    );
  }

  /// `العروض و الهدايا`
  String get offers_and_gifts {
    return Intl.message(
      'العروض و الهدايا',
      name: 'offers_and_gifts',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get sign_out {
    return Intl.message(
      'تسجيل الخروج',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `حذف الحساب`
  String get delete_my_account {
    return Intl.message(
      'حذف الحساب',
      name: 'delete_my_account',
      desc: '',
      args: [],
    );
  }

  /// `الكل`
  String get multi_vendor_home_all {
    return Intl.message(
      'الكل',
      name: 'multi_vendor_home_all',
      desc: '',
      args: [],
    );
  }

  /// `عنوانك`
  String get account_your_address {
    return Intl.message(
      'عنوانك',
      name: 'account_your_address',
      desc: '',
      args: [],
    );
  }

  /// `الضبط`
  String get account_settings {
    return Intl.message(
      'الضبط',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `النسخة`
  String get account_version {
    return Intl.message(
      'النسخة',
      name: 'account_version',
      desc: '',
      args: [],
    );
  }

  /// ` السائق وصل إلى موقعك و هو في انتظارك الان`
  String get the_driver_is_waiting_for_you {
    return Intl.message(
      ' السائق وصل إلى موقعك و هو في انتظارك الان',
      name: 'the_driver_is_waiting_for_you',
      desc: '',
      args: [],
    );
  }

  /// `شركة سديم التقنية`
  String get account_sadeem_tech_co {
    return Intl.message(
      'شركة سديم التقنية',
      name: 'account_sadeem_tech_co',
      desc: '',
      args: [],
    );
  }

  /// `لقد تم تعطيل حسابك، الرجاء مراجعة الإدارة.`
  String get banned_view_your_account_suspended {
    return Intl.message(
      'لقد تم تعطيل حسابك، الرجاء مراجعة الإدارة.',
      name: 'banned_view_your_account_suspended',
      desc: '',
      args: [],
    );
  }

  /// `الاسم واللقب`
  String get profile_edit_view_full_name {
    return Intl.message(
      'الاسم واللقب',
      name: 'profile_edit_view_full_name',
      desc: '',
      args: [],
    );
  }

  /// `الاشعارات`
  String get profile_edit_view_notification {
    return Intl.message(
      'الاشعارات',
      name: 'profile_edit_view_notification',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get profile_edit_view_save {
    return Intl.message(
      'حفظ',
      name: 'profile_edit_view_save',
      desc: '',
      args: [],
    );
  }

  /// `لا يمكن ان يكون فارغ`
  String get profile_edit_view_it_can_not_be_empty {
    return Intl.message(
      'لا يمكن ان يكون فارغ',
      name: 'profile_edit_view_it_can_not_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get profile_edit_view_address {
    return Intl.message(
      'العنوان',
      name: 'profile_edit_view_address',
      desc: '',
      args: [],
    );
  }

  /// `المنطقة`
  String get profile_edit_view_area {
    return Intl.message(
      'المنطقة',
      name: 'profile_edit_view_area',
      desc: '',
      args: [],
    );
  }

  /// `تغيير`
  String get profile_edit_view_change {
    return Intl.message(
      'تغيير',
      name: 'profile_edit_view_change',
      desc: '',
      args: [],
    );
  }

  /// `اضافة`
  String get profile_edit_view_add {
    return Intl.message(
      'اضافة',
      name: 'profile_edit_view_add',
      desc: '',
      args: [],
    );
  }

  /// `الطلب`
  String get order_view_order {
    return Intl.message(
      'الطلب',
      name: 'order_view_order',
      desc: '',
      args: [],
    );
  }

  /// `العنوان:`
  String get order_view_address {
    return Intl.message(
      'العنوان:',
      name: 'order_view_address',
      desc: '',
      args: [],
    );
  }

  /// `ملاحظات:`
  String get order_view_notes {
    return Intl.message(
      'ملاحظات:',
      name: 'order_view_notes',
      desc: '',
      args: [],
    );
  }

  /// `الغاء الطلب`
  String get order_view_order_cancel {
    return Intl.message(
      'الغاء الطلب',
      name: 'order_view_order_cancel',
      desc: '',
      args: [],
    );
  }

  /// `سنكون سعداء بسماع تعليقك وملاحظاتك وذلك لتطوير الخدمة ومتابعة الجودة`
  String get order_view_order_we_will_be_happy_to_see_your_comment {
    return Intl.message(
      'سنكون سعداء بسماع تعليقك وملاحظاتك وذلك لتطوير الخدمة ومتابعة الجودة',
      name: 'order_view_order_we_will_be_happy_to_see_your_comment',
      desc: '',
      args: [],
    );
  }

  /// `تحتاج إلى تسجيل الدخول لرؤية هذه الصفحة`
  String get not_authorized_indicator_you_need_to_login_to_see_this_page {
    return Intl.message(
      'تحتاج إلى تسجيل الدخول لرؤية هذه الصفحة',
      name: 'not_authorized_indicator_you_need_to_login_to_see_this_page',
      desc: '',
      args: [],
    );
  }

  /// `اكتب تعليقك هنا`
  String get dialog_rating_write_your_comment_het {
    return Intl.message(
      'اكتب تعليقك هنا',
      name: 'dialog_rating_write_your_comment_het',
      desc: '',
      args: [],
    );
  }

  /// `الغاء`
  String get dialog_rating_cancel {
    return Intl.message(
      'الغاء',
      name: 'dialog_rating_cancel',
      desc: '',
      args: [],
    );
  }

  /// `إرسال`
  String get dialog_rating_send {
    return Intl.message(
      'إرسال',
      name: 'dialog_rating_send',
      desc: '',
      args: [],
    );
  }

  /// `المحاولة مرة أخرى`
  String get exception_indicator_try_again {
    return Intl.message(
      'المحاولة مرة أخرى',
      name: 'exception_indicator_try_again',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأاثناء جلب البيانات`
  String get generic_error_indicator_error_while_fetching_data {
    return Intl.message(
      'حدث خطأاثناء جلب البيانات',
      name: 'generic_error_indicator_error_while_fetching_data',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال`
  String get no_connection_indicator_no_connection {
    return Intl.message(
      'لا يوجد اتصال',
      name: 'no_connection_indicator_no_connection',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء المحاولة في وقت لاحق`
  String get no_connection_indicator_try_again_later {
    return Intl.message(
      'الرجاء المحاولة في وقت لاحق',
      name: 'no_connection_indicator_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `التسجيل/ الدخول`
  String get not_authorized_indicator_login_register {
    return Intl.message(
      'التسجيل/ الدخول',
      name: 'not_authorized_indicator_login_register',
      desc: '',
      args: [],
    );
  }

  /// `فشل عملية التحقق`
  String get verify_view_verification_failed {
    return Intl.message(
      'فشل عملية التحقق',
      name: 'verify_view_verification_failed',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء الإنتظار سوف تصلك رسالة تحقق (تستغرق من دقيقة الى دقيقتين)`
  String get verify_view_it_may_take_two_minute {
    return Intl.message(
      'الرجاء الإنتظار سوف تصلك رسالة تحقق (تستغرق من دقيقة الى دقيقتين)',
      name: 'verify_view_it_may_take_two_minute',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get verify_view_edit {
    return Intl.message(
      'تعديل',
      name: 'verify_view_edit',
      desc: '',
      args: [],
    );
  }

  /// `رمز التحقق يجب ان يتكون من 6 خانات`
  String get verify_view_verification_number_have_six_digit {
    return Intl.message(
      'رمز التحقق يجب ان يتكون من 6 خانات',
      name: 'verify_view_verification_number_have_six_digit',
      desc: '',
      args: [],
    );
  }

  /// `فشل عملية التحقق`
  String get verify_view_failed_verification_process {
    return Intl.message(
      'فشل عملية التحقق',
      name: 'verify_view_failed_verification_process',
      desc: '',
      args: [],
    );
  }

  /// `تحقق`
  String get verify_view_verify {
    return Intl.message(
      'تحقق',
      name: 'verify_view_verify',
      desc: '',
      args: [],
    );
  }

  /// `الغاء`
  String get general_cancel {
    return Intl.message(
      'الغاء',
      name: 'general_cancel',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get general_yes {
    return Intl.message(
      'نعم',
      name: 'general_yes',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get general_no {
    return Intl.message(
      'لا',
      name: 'general_no',
      desc: '',
      args: [],
    );
  }

  /// `القائمة فارغة!`
  String get general_empty_list {
    return Intl.message(
      'القائمة فارغة!',
      name: 'general_empty_list',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد اي نتائج`
  String get general_not_results {
    return Intl.message(
      'لا توجد اي نتائج',
      name: 'general_not_results',
      desc: '',
      args: [],
    );
  }

  /// `بحث`
  String get general_search {
    return Intl.message(
      'بحث',
      name: 'general_search',
      desc: '',
      args: [],
    );
  }

  /// `انت غير متصل بالانترنت`
  String get general_not_connected_to_internet {
    return Intl.message(
      'انت غير متصل بالانترنت',
      name: 'general_not_connected_to_internet',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد`
  String get not_found {
    return Intl.message(
      'لا يوجد',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `تم التعديل بنجاح`
  String get has_been_edited_successfully {
    return Intl.message(
      'تم التعديل بنجاح',
      name: 'has_been_edited_successfully',
      desc: '',
      args: [],
    );
  }

  /// `هل ترغب بالانضمام كسائق ضمن البرنامج؟`
  String get sign_up_dialog {
    return Intl.message(
      'هل ترغب بالانضمام كسائق ضمن البرنامج؟',
      name: 'sign_up_dialog',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get sign_in {
    return Intl.message(
      'تسجيل الدخول',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء كتابة البريد بصورة صحيحة`
  String get wrong_email {
    return Intl.message(
      'الرجاء كتابة البريد بصورة صحيحة',
      name: 'wrong_email',
      desc: '',
      args: [],
    );
  }

  /// `بريد الالكتروني`
  String get email {
    return Intl.message(
      'بريد الالكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب ان تكون اكثر من 6 حروف`
  String get password_must_be_more_than_6_characters_long {
    return Intl.message(
      'كلمة المرور يجب ان تكون اكثر من 6 حروف',
      name: 'password_must_be_more_than_6_characters_long',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `الدخول بالبريد`
  String get sign_in_with_email {
    return Intl.message(
      'الدخول بالبريد',
      name: 'sign_in_with_email',
      desc: '',
      args: [],
    );
  }

  /// ` 'خطأ في كلمة المرور او البريد الإلكتروني'`
  String get wrong_number_or_email {
    return Intl.message(
      ' \'خطأ في كلمة المرور او البريد الإلكتروني\'',
      name: 'wrong_number_or_email',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء ادخال رمز التحقق`
  String get enter_verification_number {
    return Intl.message(
      'الرجاء ادخال رمز التحقق',
      name: 'enter_verification_number',
      desc: '',
      args: [],
    );
  }

  /// `القيادة فن.. قدم للعملاء خدمة ممتازة ونعدك بتقدير جهودك`
  String get on_boarding_slide_1 {
    return Intl.message(
      'القيادة فن.. قدم للعملاء خدمة ممتازة ونعدك بتقدير جهودك',
      name: 'on_boarding_slide_1',
      desc: '',
      args: [],
    );
  }

  /// `نسعى لضمان رحلة آمنة ومحترمة.. ونقدر حرصك على جمال سيارتك`
  String get on_boarding_slide_2 {
    return Intl.message(
      'نسعى لضمان رحلة آمنة ومحترمة.. ونقدر حرصك على جمال سيارتك',
      name: 'on_boarding_slide_2',
      desc: '',
      args: [],
    );
  }

  /// `العميل ضيف وأنت شريك.. فأكرم ضيفك وضيفنا`
  String get on_boarding_slide_3 {
    return Intl.message(
      'العميل ضيف وأنت شريك.. فأكرم ضيفك وضيفنا',
      name: 'on_boarding_slide_3',
      desc: '',
      args: [],
    );
  }

  /// `التخطي والاستمرار`
  String get skip_and_continue {
    return Intl.message(
      'التخطي والاستمرار',
      name: 'skip_and_continue',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get account_about_app {
    return Intl.message(
      'عن التطبيق',
      name: 'account_about_app',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل حساب جديد`
  String get login_view_sign_up {
    return Intl.message(
      'تسجيل حساب جديد',
      name: 'login_view_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل`
  String get sign_up_view_sign {
    return Intl.message(
      'تسجيل',
      name: 'sign_up_view_sign',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
