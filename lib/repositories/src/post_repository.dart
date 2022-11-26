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
      log(response.message.toString());
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
    Map<String, String> body = {
      "id": "11",
      "title": newPost.title!,
      "body": newPost.body!,
      "userId": "1"
    };
    try {
      AppResponse<PostModel> response = await apiClient.createPost(body);

      _postList.add(newPost);
      log("Post Added $newPost ${response.data}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removePost({required PostModel post}) async {
    try {
      AppResponse<PostModel> response = await apiClient.deletePost(post);
      _postList.remove(post);
      log("Post Removed $post");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
