import 'package:arrivo_web/models/models.dart';
import 'package:arrivo_web/utils/utils.dart';

class UserRepository {
  List<UserModel> getUserList() {
    List<UserModel> userData = StagingUser.userList;

    return userData;
  }
}
