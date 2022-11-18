import 'dart:developer';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/utils.dart';

class PostRepository {
  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;

  List<PostModel> getpostList() {
    List<PostModel> postData = StagingPost.postList;
    if (postData.every((element) => postList.contains(element))) {
      return postList;
    } else {
      _postList.addAll(postData);
      return postList;
    }
  }

  Future<void> addPost({required PostModel newPost}) async {
    try {
      _postList.add(newPost);
      log("Post Added $newPost");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removePost({required PostModel Post}) async {
    try {
      _postList.remove(Post);
      log("Post Removed $Post");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
