import 'dart:convert';
import 'dart:io';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/src/http_helper.dart';
import 'package:Blog_web/utils/utils.dart';

class APIClient {
  Map<String, String> get authHeader => {"Authorization": "Bearer "};

  Future<AppResponse<PostModel>> getPostsById() async {
    Uri uri = Uri.parse(APIUrl.apiUrl + APIUrl.postUrl);
    return await (HttpHelper<PostModel>(headers: authHeader)).get(uri);
  }

  Future<AppResponse<PostModel>> getPosts() async {
    Uri uri = Uri.parse(APIUrl.apiUrl + APIUrl.postUrl);
    return await (HttpHelper<PostModel>(headers: authHeader)).getAsList(uri);
  }

  Future<AppResponse<CommentModel>> getComments(int postId) async {
    Uri uri = Uri.parse(APIUrl.apiUrl +
        APIUrl.postUrl +
        "/${postId.toString()}" +
        APIUrl.commentsUrl);
    return await (HttpHelper<CommentModel>(headers: authHeader)).getAsList(uri);
  }

  Future<AppResponse<PostModel>> createPost(Map<String, String> body) async {
    Uri uri = Uri.parse(APIUrl.apiUrl + APIUrl.postUrl);
    return await (HttpHelper<PostModel>(headers: authHeader)).post(
      uri,
      body: jsonEncode(body),
    );
  }
}
