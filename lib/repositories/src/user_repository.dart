import 'dart:developer';

import 'package:arrivo_web/models/models.dart';
import 'package:arrivo_web/utils/utils.dart';

class UserRepository {
  List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  List<UserModel> getUserList() {
    List<UserModel> userData = StagingUser.userList;
    if (userData.every((element) => userList.contains(element))) {
      return userList;
    } else {
      _userList.addAll(userData);
      return userList;
    }
  }

  Future<void> addUser({required UserModel newUser}) async {
    try {
      _userList.add(newUser);
      log("USER Added $newUser");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
