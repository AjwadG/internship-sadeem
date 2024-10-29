
import '/core/constant/local_keys.dart';

/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  final phoneNumberRegExp = RegExp(r'^2189(1|2|3|4|5|6)\d{7}$');

  final numberRegExp = RegExp(r'^\d{6}$');

  final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  String? validateEmail(String value) {
    if (!emailRegExp.hasMatch(value.trim())) {
      return LocalKeys.invalid_email;
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (!phoneNumberRegExp.hasMatch(value.trim())) {
//      print(value);
      return LocalKeys.invalid_phone_number;
    }
    return null;
  }

  String? validateEmptyString(String value) {
    if (value.isEmpty) {
      return LocalKeys.invalid_empty_text;
    }
    return null;
  }

  String? validateStringMaxLength(String value, int max) {
    if (value.isEmpty) {
      return LocalKeys.invalid_empty_text;
    }
    if (value.length > max) {
      return 'النص أطول من المطلوب';
    }

    return null;
  }

  String? validateIsNotNull(Object value) {
    if (value == null) {
      return LocalKeys.invalid_empty_text;
    }
    return null;
  }

  String? validateNumber(String value) {
    if (!numberRegExp.hasMatch(value.trim())) {
      print(value);
      return LocalKeys.invalid_phone_number;
    }
    return null;
  }

  String? validateZip(String value) {
    if (!zipCodeRegExp.hasMatch(value.trim())) {
      return LocalKeys.invalid_zip_code;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return LocalKeys.password_empty;
    } else if (value.length <= 6) {
      return LocalKeys.password_short;
    }
    return null;
  }
}
