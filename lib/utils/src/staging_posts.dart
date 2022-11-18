import 'package:Blog_web/models/models.dart';

class StagingPost {
  static List<PostModel> postList = [
    const PostModel(
        id: 1,
        title: "How to flutter",
        body: "<p>Body1<p>",
        categoryId: 1,
        status: "Pending",
        label: MemberStatus.premium),
    const PostModel(
        id: 2,
        title: "Its very Important",
        body: "<h1>Body1<h1><p>TestBody<p>",
        categoryId: 3,
        status: "Draft",
        label: MemberStatus.normal),
    const PostModel(
        id: 3,
        title: "Flutter",
        body: "<p>Body1<p>",
        categoryId: 3,
        status: "Published",
        label: MemberStatus.premium),
    const PostModel(
        id: 4,
        title: "Web",
        body: "<p>Body1<p>",
        categoryId: 2,
        status: "Draft",
        label: MemberStatus.normal)
  ];
}
