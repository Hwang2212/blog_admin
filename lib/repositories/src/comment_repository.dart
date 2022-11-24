import 'dart:developer';

import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/services/src/api_client.dart';
import 'package:Blog_web/utils/src/http_helper.dart';
import 'package:Blog_web/utils/utils.dart';

class CommentRepository {
  APIClient apiClient = APIClient();
  List<CommentModel> _commentList = [];
  List<CommentModel> get commentList => _commentList;

  Future<List<CommentModel>> getCommentList(int postId) async {
    AppResponse<CommentModel> response = await apiClient.getComments(postId);
    if (response.apiResponse == APIResponse.success) {
      _commentList = response.dataAsList!;
      log(_commentList.toString());
      return commentList;
    } else {
      return commentList;
    }
  }
}
