import 'dart:developer';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/services/src/api_client.dart';
import 'package:Blog_web/utils/src/http_helper.dart';
import 'package:Blog_web/utils/utils.dart';

class PostRepository {
  APIClient apiClient = APIClient();
  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;

  Future<List<PostModel>> getpostList() async {
    AppResponse<PostModel> response = await apiClient.getPosts();
    if (response.apiResponse == APIResponse.success) {
      _postList = response.dataAsList!;
      return postList;
    } else {
      return postList;
    }
    // List<PostModel> postData = StagingPost.postList;
    // if (postData.every((element) => postList.contains(element))) {
    //   return postList;
    // } else {
    //   _postList.addAll(postData);
    //   return postList;
    // }
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
