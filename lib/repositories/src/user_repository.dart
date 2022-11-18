import 'dart:developer';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/utils.dart';

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

  Future<void> removeUser({required UserModel user}) async {
    try {
      _userList.remove(user);
      log("USER Removed $user");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
