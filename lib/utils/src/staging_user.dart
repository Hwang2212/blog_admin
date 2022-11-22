import 'package:Blog_web/models/models.dart';

class StagingUser {
  static List<UserModel> userList = [
    UserModel(
        id: 1,
        fullName: "Ali",
        username: "user123",
        password: "abc123",
        membership: MemberStatus.normal),
    UserModel(
        id: 2,
        fullName: "Banana",
        username: "bnn",
        password: "abc123", 
        membership: MemberStatus.premium),
    UserModel(
        id: 3,
        fullName: "Coconut",
        username: "cocu",
        password: "abc123",
        membership: MemberStatus.normal),
  ];
}
