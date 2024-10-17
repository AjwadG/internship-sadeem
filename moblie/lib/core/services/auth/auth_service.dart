import 'package:flutter/src/widgets/framework.dart';

import '/core/models/user/user.dart';

abstract class AuthService {
  User get currentUser;

  Future<bool?> signUp(Map<String, String> parameters);

  Future<bool?> loginWithEmail(Map<String, String> parameters);

  Future<void> signOut(BuildContext context);
}
