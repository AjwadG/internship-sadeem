// ignore: library_prefixes
import 'package:internship/core/services/permissions/permissions_service.dart';

import '/core/services/key_storage/key_storage_service.dart';
import '/locator.dart';

class PermissionsServiceImpl implements PermissionsService {
  @override
  bool get isLoggedIn {
    if (locator<KeyStorageService>().token!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
