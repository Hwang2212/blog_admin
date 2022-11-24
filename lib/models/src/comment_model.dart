import 'package:Blog_web/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class CommentModel with _$CommentModel {
  const factory CommentModel(
      {int? id, String? name, String? email, String? body}) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
