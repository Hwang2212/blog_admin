import 'dart:convert';
import 'dart:io';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/src/http_helper.dart';
import 'package:Blog_web/utils/utils.dart';

class APIClient {
  
  Map<String, String> get authHeader => {"Authorization": "Bearer "};

  Future<AppResponse<PostModel>> getPosts() async {
    Uri uri = Uri.parse(APIUrl.apiUrl + APIUrl.postUrl);
    return await (HttpHelper<PostModel>(headers: authHeader)).get(uri);
  }
}
